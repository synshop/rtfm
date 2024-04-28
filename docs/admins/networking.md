# Networking

## Overview

We have two DHCP servers and 3 WiFi SSIDS.

### Wifi:

- synshop - 10.0.40.x range
- synshop_unfiltered - 10.0.50.x range
- synshop_hostile - 10.0.60.x range

### DHCP:

- 10.0.40.x range - Managed by PiHole, with static leases for infrastructure devices and 6hr dhcp leases for users. This network uses PiHole for DNS
- 10.0.50/60.x range - Managed by the Router, both will bypass the DNS of PiHole using their own DNS

### IP info

All IP addresses are tracked in a spreadsheet, and can be found int he tech-team discord channel.
