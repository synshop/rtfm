# Shop LAN & WiFi

## Overview

We have two DHCP servers and 3 WiFi SSIDS.

### Related:

* [Pi-hole](https://rtfm.synshop.org/admins/pi-hole-stubby/)
* [Caddy and TLS](https://rtfm.synshop.org/admins/Caddy%20and%20TLS%20certs/)
* [Unifi AP container](https://rtfm.synshop.org/admins/unifi/)

### Adding a new permenant device on the LAN

- set a static DHCP lease on Pi-hole
- update LAN Map
- optionally a static IP which needs to unused and be below  `.150`

### Wifi:

Shop owns 3 Unif APs, but currently only 1 is deployed which is setup up with 3 SSIDs. synshop is one one `vlan` and `unfiltered` and `hostile` are another vlan:

- synshop - 10.0.40.x range
- synshop_unfiltered - 10.0.50.x range
- synshop_hostile - 10.0.60.x range - isolated in a DMZ. Is "hostile" because you could safely put what ever VM/CTF/whatnot in here without affecting other stuff. 

### DHCP:

- 10.0.40.x range - Managed by PiHole, with static leases for infrastructure devices and 6hr dhcp leases for users. This network uses PiHole for DNS
- 10.0.50/60.x range - Managed by the Router, both will bypass the DNS of PiHole using 9.9.9.9 DNS

### IP info

All IP addresses are tracked in a spreadsheet, and can be found int he tech-team discord channel.
