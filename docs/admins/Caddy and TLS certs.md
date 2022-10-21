# Caddy and TLS certs

## Intro

[Caddy](https://caddyserver.com/docs/install) provides a reverse proxy with TLS termination for all internal services at the shop.  
You must be on the shop LAN or on the shop VPN to access it. Working with [`certbot`](https://certbot.eff.org/instructions?ws=other&os=ubuntufocal&commit=%3E),
we can get wildcard certs for all services.

Caddy runs as a container on the [c220](/admins/c220/) on container named `caddy` with IP `10.0.40.29`

## Install Caddy

Assuming Ubuntu 22, following their install docs:

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

systemctl enable caddy
systemctl start caddy
```

## Install certbot

```bash
sudo snap install core; sudo snap refresh core
```

Verify that `list-timers` will run the renew:

```bash
systemctl list-timers|grep certbot
```

Get the python script and make it executable:

```bash
mkdir -p /etc/letsencrypt/
curl -o /etc/letsencrypt/acme-dns-auth.py https://raw.githubusercontent.com/joohoi/acme-dns-certbot-joohoi/master/acme-dns-auth.py
chmod +x /etc/letsencrypt/acme-dns-auth.py
apt install python3
ln -s /usr/bin/python3 /usr/bin/python
```

## First time cert generation w/ DNS update

You only have to do this ONCE!

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


## Adding service

Assuming you had a new service at `10.0.40.201` called `test.synshop.net`, you would:

1. ssh into caddy box 
2. `vim /etc/caddy/Caddyfile`
3. add new host entry:

        test.synshop.net {
           tls //etc/letsencrypt/live/synshop.net/fullchain.pem /etc/letsencrypt/live/synshop.net/privkey.pem
           reverse_proxy 10.0.40.201
        }

4. restart caddy:  `systemctl restart caddy`

Note: if you need to point to a system that has a self signed cert, you need to both ignore the cert error, and add more info to the config, like this:

```yaml
test.synshop.net {
   tls /etc/letsencrypt/live/synshop.net/fullchain.pem /etc/letsencrypt/live/synshop.net/priv
key.pem
   reverse_proxy {
      to https://10.0.40.201
      transport http {
            tls
            tls_insecure_skip_verify
         }
      }
}
```

Set up new DNS entry:

1. log into [pihole](https://10.0.40.66/admin/)
2. go to   [custom DNS](https://10.0.40.66/admin/dns_records.php)
4. add new DNS entry for `10.0.40.29` to resolve to  `test.synshop.net`. Note that `.29` is the IP of caddy, not the IP of the service your proxying.

