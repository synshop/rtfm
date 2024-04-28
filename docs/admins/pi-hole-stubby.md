# Pi-Hole DNS 
SYN Shop runs it's own instances of [Pi-Hole](http://pi-hole.net/)  Pi-Hole is a local DNS resolver that blacklist domains that serve ads.

Pi-hole LXC is hosted on the Proxmox server.


## Pi-Hole

To set up the Pi-Hole, do the generic install via ``curl -sSL https://install.pi-hole.net | bash``. On the Settings -> System page, flush logs and disable query logging.  On Settings -> DNS page, set "Custom 1 (IPv4)" to ``127.1.1.1`` and ``Listen on all interfaces, permit all origins``.  On Settings -> Privacy, set it to ``Paranoia mode``. This way no logs will be stored of any DNS lookups.
