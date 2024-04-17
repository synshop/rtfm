# Caddy and TLS certs

## Intro

[Caddy](https://caddyserver.com/docs/install) provides a reverse proxy with TLS termination for all internal services at the shop.  
You must be on the shop LAN or on the shop VPN to access it. Working with [`certbot`](https://certbot.eff.org/instructions?ws=other&os=ubuntufocal&commit=%3E),
we can get wildcard certs for all services.

Caddy runs as a container on the [proxmox server](/admins/proxmox/) on container named `caddy` with IP `10.0.40.29`

Finally `new-lagos.synshop.org`  provides DNS with `bind` to match FQDN <-> TLS CN. See below to update DNS entries.

## Install 

### Caddy

Assuming Ubuntu 22, following [their install docs](https://caddyserver.com/docs/install#debian-ubuntu-raspbian):

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

systemctl enable caddy
systemctl start caddy
```

### certbot

With the way proxmox does LXC containers,  the normal [install docs](https://certbot.eff.org/instructions?ws=other&os=ubuntufocal&commit=%3E) don't work.  Instead we had to use `pip` and friends to achieve the same result:

```bash
sudo apt update && sudo apt install python3 python3-venv libaugeas0
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
```

Then add a cronjob to check for renawals:

```
echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(random.random() * 3600)' && sudo /usr/bin/certbot renew -q" | sudo tee /etc/cron.d/certbot > /dev/null
```

Get [the python script](https://github.com/joohoi/acme-dns-certbot-joohoi) and make it executable. This uses the acme-dns.io DNS service with some CNAME trickery:

```bash
mkdir -p /etc/letsencrypt/
curl -o /etc/letsencrypt/acme-dns-auth.py https://raw.githubusercontent.com/joohoi/acme-dns-certbot-joohoi/master/acme-dns-auth.py
chmod +x /etc/letsencrypt/acme-dns-auth.py
ln -s /usr/bin/python3 /usr/bin/python
```

### First time cert generation w/ DNS update

**You only have to do this ONCE!**

On the Caddy box, initiate a request for `*.synshop.net` and `synshop.net` domains, with a manual DNS validation:

```bash
sudo certbot certonly --manual --manual-auth-hook /etc/letsencrypt/acme-dns-auth.py --preferred-challenges dns --debug-challenges -d \*.synshop.net -d synshop.net
```

You'll then be prompted to create a DNS entry, something like:

```
_acme-challenge.synshop.net. 	CNAME	87e00274-4d33-43fa-acc9-10839cee980a.auth.acme-dns.io.
```

Create this by:

1. SSH to `new-lagos.synshop.org`
1. `sudo su -`
1. `vim /etc/bind/master/synshop.net`
1. edit serial number at top to be today's date
1. add new line for above DNS entry
1. restart DNS with `rndc reload`

Credentials are now stored in JSON in `/etc/letsencrypt/acmedns.json`. These are backed up in keepass just in case. 
Though you could go through above steps again if they're lost.

Back on the certbot box, hit return to continue the validation process. Certs should 
be created in `/etc/letsencrypt/live/synshop.net/`

To ensure the wildcard cert reloads every week, add a cronjob as the root user on the caddy box:

```
# restart caddy to reload certs once a week on 8.05 every sunday
5   8  *   *   0     /usr/bin/systemctl restart caddy
```

## Set default cert in Caddy

In `/etc/caddy/Caddyfile` declare the top most host as shown below.  All subsequent hosts will inherit this cert:

```bash
# this host just declared to define default cert all other hosts inherit
:443 {
   tls /etc/letsencrypt/live/synshop.net/fullchain.pem /etc/letsencrypt/live/synshop.net/privkey.pem
   root * /usr/share/caddy/
   file_server
}
```

## Adding service

### Configure Caddy 

Assuming you had a new service at `10.0.40.201` called `test.synshop.net`, you would:

1. ssh into caddy box 
2. `vim /etc/caddy/Caddyfile`
3. add new host entry (and see "Variations on Caddyfile entries" below). Because we declared a default host above, we can just add 3 lines which include the `host` and `IP`.  It implicitly uses port `80` for IPv4 hosts:

        foobar.synshop.net {
           reverse_proxy 10.0.40.201
        }

4. restart caddy: `systemctl restart caddy`

### Configure DNS Entry on `new-lagos.synshop.org`

**NOTE!** - There is a wildcard `CNAME` entry for `*.synshop.net` to point to Caddy.  You only need to make a DNS entry if you want it to NOT point to Caddy.

Set up new DNS entry:

1. SSH into `new-lagos.synshop.org` and `sudo su -` to become root
1. `vim /etc/bind/master/synshop.net`
1. Add a new `A` recrod entry for your new service, looking at existing ones for a template.
1. Modify the serial number (SOA) at top to be today's date + a unique 2 digit integer (it looks something like `2023090116; serial, todays date + serial #` )
1. Restart DNS with `rndc reload`.

### Variations on Caddyfile entries

Step 3 above in "Configure Caddy" can have other options to support self signed certs and IPv6 hosts (or both!). 

#### Self signed cert

We go from 3 lines to 9. The main difference is that we're telling it which `IP` with `https://` and to ignore self signed certs with `tls_insecure_skip_verify`:

```yaml
test.synshop.net {
   reverse_proxy {
      to https://10.0.40.201
      transport http {
            tls
            tls_insecure_skip_verify
         }
      }
}
```

#### IPv6 entry

Note the use of brackets around the IP `[]` and port at the end `:80`. 

```yaml
test.synshop.net {
        reverse_proxy [fd42:7c97:9426:8f29:216:3eff:fe0a:71c9]:80 
}
```

