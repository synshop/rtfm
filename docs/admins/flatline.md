# Flatline

the firewall and switch point to flatline for auth over the [TACACS protocol](https://en.wikipedia.org/wiki/TACACS). kind of like radius, but doesn't suck. that's configured to allow you to authenticate, and uses PAM for where it gets that auth. PAM is set to use the local user database on the box