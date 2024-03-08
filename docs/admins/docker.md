# Docker (and Portainer)

## Overview

There is a vm "Docker" on Proxmox. This is a centralized docker host for any docker containers needed. The ssh creds for this host are located in keepass.

There is a docker container for Portainer running, which is a web interface used for managing all other containers. This interface can be used to deply other compose files, maintain existing ones, and has granular user permissions if we ever need to give isolated user perms.

The webUI login is in keepass and can be reached at [http://portainer.synshop.net:9000](http://portainer.synshop.net:9000)

## Updating portainer

Portainer can't be updated from within itself. Instead this is done via CLI on the docker host itself. Inside the home directory of the `ubuntu` user is a portainer-compose.yml file. To updated Portainer CE (Community Edition) to the lateest, run the following:
```
> docker stop portainer
> docker rm portainer
> docker pull portainer/portainer-ce:latest
> sudo docker compose -f portainer-compose.yml up -d
```
This will remove the old container, grab the latest image, and rebuild the container using the existing compose file. Don't worry about the data, the docker volume it relies on exists "outside" the constiner and is persistent, which the compose file will re-link it to.

The portainer config should be backed up to a config file export and saved to the Vault NAS periodically, especially after major changes.

## Deploying new containers

This is not a comprehensive portainer guide. However some basics are as follows:

* Go to Stacks > +Add A Stack to use the web UI to write a new compose file. Make sure you define a volume at the end of the file with a local driver to ensure persistent storage between images.
* On http/s ports, the following standardization is being used: 80xx for http ports, and 84xx for https ports. If using both ports on a container, it's best if they are the same XX value after 80/84.
* Most containers should be created as admin, with admin-viewable only left on the default on. This way if individual members are given access for their own use, they can't alter these core containers.
* If the NAS ever needs an NFS share exposed to a docker container, this can be done via the Volumes panel, where an NFS share can be mapped and loaded as an `external` volume on any container.

### To Do:

1. Install traefik to act as a reverse proxy, so we can rely on port 80/443 with self hosted *.synshop.net tls certs for all containers.
2. 
