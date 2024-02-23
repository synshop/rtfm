# Proxmox

## Overview

A desktop tower with [Proxmox](https://www.proxmox.com/en/) installed on it was deployed to: 

* Be a future home for all LXD containers on the c220 so the c220 can eventually be retired
* Host future projects that need a VM at the shop
* Host 4 x 12TB drives to serve media to the shop LAN

All Proxmox admin is done through the web GUI at [https://proxmox.synshop.net](https://proxmox.synshop.net), which is reverse proxied through the Caddy server to have a valid TLS cert.  The baremetal IP is `10.0.40.16`, but of course the proxmox.synshop.net domain resolves to Caddy at `.29`.

To log into the server, be on the VPN or at the shop, go the [URL](https://proxmox.synshop.net) and use the `proxmox` credentials from the shop password database.

## Install & Hardware

Proxmox was installed with these 7 drives:

* 256GB Apple branded 2.5" SATA SSD: boot drive for prox mox (`/dev/sdc`) . Shows as `local-lvm` or `pve` in Proxmox
* 256GB NVMe SSD: data volume for all active VMS (`/dev/nvme0n1`). Shows as `local` or `vmdata` in Proxmox.
* 3TB SATA: Backup drive for all Proxmox data, VMs etc. (`/dev/sde`). Shows as `backups` in Proxmox.
* 4 x 12TB SATA: TBD use for NAS/Media sharing (`/dev/sda`, `/dev/sdb`, `/dev/sdd` and `/dev/sdf` ). 

Here's the output of `lsblk`:

```shell
root@proxmox:~# lsblk
NAME                        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                           8:0    0  10.9T  0 disk /mnt/nas/ZTN19LH8
sdb                           8:16   0  10.9T  0 disk /mnt/nas/ZTN1AT71
sdc                           8:32   0 233.8G  0 disk 
├─sdc1                        8:33   0  1007K  0 part 
├─sdc2                        8:34   0     1G  0 part /boot/efi
└─sdc3                        8:35   0 232.8G  0 part 
  ├─pve-swap                252:0    0     8G  0 lvm  [SWAP]
  ├─pve-root                252:1    0  68.2G  0 lvm  /
  ├─pve-data_tmeta          252:2    0   1.4G  0 lvm  
  │ └─pve-data-tpool        252:6    0 137.8G  0 lvm  
  │   ├─pve-data            252:7    0 137.8G  1 lvm  
  │   └─pve-vz              252:8    0   230G  0 lvm  /mnt/nvme
  └─pve-data_tdata          252:3    0 137.8G  0 lvm  
    └─pve-data-tpool        252:6    0 137.8G  0 lvm  
      ├─pve-data            252:7    0 137.8G  1 lvm  
      └─pve-vz              252:8    0   230G  0 lvm  /mnt/nvme
sdd                           8:48   0  10.9T  0 disk /mnt/nas/ZTN1CWZL
sde                           8:64   1   2.7T  0 disk 
└─sde1                        8:65   1   2.7T  0 part /mnt/pve/backups
sdf                           8:80   1  10.9T  0 disk /mnt/nas/ZRT122RV
nvme0n1                     259:0    0 232.9G  0 disk 
└─nvme0n1p1                 259:1    0 232.9G  0 part 
  ├─vmdata-vm--100--disk--0 252:4    0    32G  0 lvm  
  └─vmdata-vm--101--disk--0 252:5    0    30G  0 lvm  
```

Within Proxmox, you can see the drives this way:

![Screenshot of drives in the proxmox mox disks page](./images/proxmox.drives.png)


## Downloading a new ISO 

To add a new  ISO so that you can create a VM with it later:

1. Navigate to `local` storage on left
2. Click `ISO Images` in middle
3. click `Upload` button at top
4. Enter ISO URL and click `Download`

![Screenshot of adding a new ISO with 4 arrows denoting order of steps](./images/new.iso.png)

## Creating a new VM

1. On the left, Click "Datacenter" and then "Proxmox"
2. In the upper right click "Create VM"
3. On the `General` screen leave `Node` and `VM ID` with the default value.  Enter a descriptive, but short name in `Name`.
4. Check the `Advanced` check box near the bottom and check `Start at boot` box to ensure the VM is booted when ever the system reboots.
5. Click `Next`
6. On the `OS` screen, if you're installing from an ISO,  for `Storage` choose `local` and choose the ISO in the `ISO image` drop down.
7. Leave all other fields with default values and click `Next`
8. On the `System` screen, leave all fields with default values and click `Next`
9. On the `Disks` screen, choose `vmdata` for `Storage` which uses the "256GB NVMe SSD" device for very fast data.
10. If you need more or less storage than `32`, update the `Disk Size (GiB)` as needed.
11. Leave all other fields with default values and click `Next`
12. On the `CPU` screen, choose `2` for `cores` and leave all the rest default and click `Next`
13. On the `Memory` screen, add more or less RAM than `2GB` as needed. Leave all the rest default and click `Next`
14. On the `Network` screen, leave all fields with default values and click `Next` (be sure to set a static IP in the VM after it boots)
15. On the `Confirm` screen, review all data and click `Finish` 
16. Click on the right side of the screen where your new VM shows up as `NUMBER (Name)` eg `102 (truenas)`
17. Click `Console` and choose `Start now` 


## NAS Drives


