# Pi-Hole and Stubby 

SYN Shop runs it's own instances of [Pi-Hole](http://pi-hole.net/) and [Stubby](https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby) so that our DNS is both encrypted on the wire and ad free.  They're largely set up like [mrjones' blog post](https://blog.plip.com/2018/04/22/stubby-pi-hole-quad9-lxd/).  Pi-Hole is a local DNS resolver that blacklist domains that serve ads. Stubby is a local DNS proxy that accepts unencupted DNS requests and relays them to an upstream resolver via DNS over TLS (DoT).  We currently use [Quad 9](https://quad9.com/) for upstream DNS service as they don't log and IPs or queries.

All VMs are hosted on the c220 running LXD.

## Stubby

### 16.04
For Ubuntu 16.04, follow mrjones' blog post link above for compiling from source. 

### 18.04
For Ubuntu 18.04, just run ``apt-get install stubby``.  You'll have to comment out ``DynamicUser=true`` in ``/lib/systemd/system/stubby.service`` and then run ``systemctl daemon-reload`` 

### Shared

Both 16.04 and 18.04 have the same config after you've installed it per the steps above.  Edit ``/etc/stubby/stubby.yml`` so that it's only listening on ``127.1.1.1`` (no IPv6) and is only relaying to Quad9.  For synshop-unfiltered network/wifi, use 9.9.9.10.  For synshop wifi, use 9.9.9.9.

Be sure to have it enabled and started:

```
systemctl enable stubby
systemctl start stubby 
```

## Pi-Hole

To set up the Pi-Hole, do the generic install via ``curl -sSL https://install.pi-hole.net | bash``. On the Settings -> System page, flush logs and disable query logging.  On Settings -> DNS page, set "Custom 1 (IPv4)" to ``127.1.1.1`` and ``Listen on all interfaces, permit all origins``.  On Settings -> Privacy, set it to ``Paranoia mode``. This way no logs will be stored of any DNS lookups.
