# membership website

## Intro

Membership is hosted at both membership.synshop.org and membership-dev.synshop.org on new-lagos.synshop.org.  It's a python flask app and has a [GH Repo](https://github.com/synshop/membership.synshop.org).


![Screenshot of membership page with account, donation and locker prices](./images/membership.png)
```
apt install python3 python3.10-venv certbot debian-keyring debian-archive-keyring apt-transport-https
```
## One time setup

1. create DNS entries to server. "server" in this case on lagos-new
2. on server, install pre-reqs:
   
        apt install python3 python3.10-venv certbot debian-keyring debian-archive-keyring apt-transport-https 
   
3. install `caddy` key and repo:

        curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
        sudo apt update
        sudo apt install caddy
   
4. create new `membership` user on server
5. create new ed25519 ssh key WITHOUT a password for `membership` on server
6. add the public SSH key to the [Deploy Keys](https://github.com/synshop/membership.synshop.org/settings/keys/new) for Membership GitHub Repo. Ensure it is read only when adding it.
7. while logged in as `membership` in `/home/membership`, clone the repo twice:

        git git@github.com:synshop/membership.synshop.org.git membership.synshop.org
        git git@github.com:synshop/membership.synshop.org.git membership-dev.synshop.org
   
8. create a virtualenv for each install:

        cd /home/membership/membership.synshop.org
        python3 -m venv venv;. venv/bin/activate
        cd /home/membership/membership-dev.synshop.org
        python3 -m venv venv;. venv/bin/activate
   
9. ensure each repo is on the correct branch\

        cd /home/membership/membership.synshop.org
        git fetch
        git checkout membership.synshop.net
        cd /home/membership/membership-dev.synshop.org
        git fetch
        git checkout membership-dev.synshop.org
   
10. TK: pip install stuff
11. TK: copy config file
12. TK: copy over two instances of TK system.service file - modify as needed
13. TK: enable and start two systemd service
14. TK: reboot server to make sure two services come up


## Pushing new content live

1. SSH to new-lagos
1. switch user to `membership` user: `sudo su - memberhsip`
1. cd into dev or prod: `cd membership.synshop.org` or `cd membership-dev.synshop.org`
1. pull in the latest code: `git pull origin`
1. restart the server: `systemctl restart membership` or `systemctl restart membership-dev`

## Development

TBD
