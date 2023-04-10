# synbackup

This is one of the old shop mini PCs that had Ubuntu 22.04 installed on and serves two primary purposes:

* Run a backup instance of LXD which we can sync containers from c220 to 
* Run [borg](https://borgbackup.readthedocs.io) which can be used over SSH to backup systems to (DNS, DHCP, web servers etc)

It's located on top of the c220 in the rack and has IP `10.0.40.33`

## SSH

Primary access is done via SSH. The users are:

* aakin  
* borg  
* krux  
* mrjones  
* munroebot  
* sargonas

## LXD

### Setup

Install LXD, run `lxd init` and accepting all defaults, except:
* create a 100GB ZFS soft disk instead default smaller size
* match the ZFS pool name to be `lxd-data`.  You can check this with `zpool list` on either machine
* match the bridge name to be `br0`
* add a new interface `lxcbr1` to the lxd which matches  the private LAN on c220 used to route `caddy` traffic between containers: `lxc network create lxcbr1`

### Backup of c220

on the synbackup box, run this command for each container you want to backup. Here we backup the all the known containers currently:

```
lxc copy --refresh --verbose c220:shopIdentifyer shopIdentifyer
lxc copy --refresh --verbose c220:caddy caddy
lxc copy --refresh --verbose c220:discord-bot discord-bot
lxc copy --refresh --verbose c220:enabler enabler
lxc copy --refresh --verbose c220:flatline flatline
lxc copy --refresh --verbose c220:munroebot-access-dev munroebot-access-dev
lxc copy --refresh --verbose c220:nexus nexus
lxc copy --refresh --verbose c220:sargonas sargonas
lxc copy --refresh --verbose c220:unifi unifi
lxc copy --refresh --verbose c220:pihole-40 pihole-40
```

This is run once a week in a cronjub under `mrjones` user:

```
# m h  dom mon dow   command
5   7  *   *   Sun   /home/mrjones/backup.lxd.containers.sh
```

## Borg

The backup reposotory is under the `borg` user and is at `/home/borg/backups`.  The password in is in the password safe.  It is the same password for the `borg` user and the `backups` borg archive.

### Adding a new machine to be backed up

#### On the remote machine

1. Install borg.  For Debian/Ubuntu: `apt install borgbackup`
2. Create an ssh key with out a password: `ssh-keygen -t ed25119`
3. Create a cronjob (`crontab -e`) with two entries. Be sure to replace the password (`PASSWORD_FROM_KEEPASS`) and directories to backup (`/directory1/to/backup`) with real values:
   ```
   # m h  dom mon dow   command
   0   4  *   *   *     BORG_PASSPHRASE=PASSWORD_FROM_KEEPASS /usr/bin/borg create -v --stats borg@10.0.40.33:/home/borg/backups::{hostname}-{now:\%Y-\%m-\%d}  /directory1/to/backup /directory2/to/backup
   0   5  *   *   *     BORG_PASSPHRASE=PASSWORD_FROM_KEEPASS /usr/bin/borg prune -v --list borg@10.0.40.33:/home/borg/backups --prefix '{hostname}' --keep-daily=7 --keep-weekly=4 --keep-monthly=6
   ```
   
#### On the synbackup

1. Copy the public SSH key from step #2 above
2. Add it to `/home/borg/.ssh/authorized_keys`, but locked down like this.  Be sure to replace the key in this value:
  ```
  command="borg serve --append-only --restrict-to-path /home/borg/",restrict ssh-ed25519 AAAAC-SSH-KEY-HERE-EiJ root@caddy
  ```
