# Member Boxes FAQ

**What exactly are you offering?** 

We're offering a small virtual machine (VM) with 512MB RAM, 1 CPU, 10GB of disk and 1Mbit of network.  These must be an Ubuntu instance.  

**Why only Ubuntu?** 
The server is running the LXD hypervisor which uses the Linux Kernel for all VMs.  This means you can only run OSes that use the same kernel, like Ubuntu.  

**Wait, I can have a FREE server with my membership!?**  

Yes!  However, there are three main limitations:

1. These are for personal use only. If you want to do something commercial check out the other VM providers - [they start at about $5/mo](https://www.digitalocean.com/pricing/ ).
1. This is not a production environment.  We'll try to keep the VMs up 100% of the time, but we don't have fancy hardware like battery back up and there'll likely be outages here and there. Otherwise, these are full VMs where you have root and can install any software that will fit on 1 CPU/512GB RAM and 10GB of disk.  Hack away, hacker!!
1. These machines are only accessible via SSH.  So, for example, you can not run a web server that is accessible on the internet (though it would be accessible at the shop!)

**So if I can’t run a publicly accessible service, like a web server, what can I do with it?**
  
So, so many things!  The main thing we hope you’ll do is learn about linux and the command line.  However, you could set up a web server which is accessible only at the shop.  You could have nagios server for monitoring your other services.  The world is your (internet not accessible) oyster!!

**I don't like the command line - do you have a web UI where I can easily do X (where X is install something etc.)?**

No!  These are bare VMs that are ripe for the taking.  You need to either A) be versed in the command line to know what your doing or B) have a hankering to learn.  If you ask, we'll be happy to teach you how to set up a server!

**I'm really concerned about privacy - will my secrets be safe on my server?** 

Yes and no!

Yes - we'll ensure the VM can only be access via an SSH key, you could opt to not have port 80 and port 443 exposed and have a server no one knows about.  We'll keep the host OS up to date.  Likely no one on the internet will gain access to your server.

No - the shop is where the host server is which is porous venue.  Theft is a possibility. Currently the drives of the server are un-encrypted and a motivated attacker could access your data. Caveat Emptor.

**Ok, I'm in - how do I sign up?** 

Email mrjones@synshop.org and supply me with your username you use on synshop.org to pay your membership and your public SSH key.

**That all sounds great, but I have more questions/don't know what an SSH key is/need help - what do I do?**

Still email mrjones@synshop.org!  We'll figure a time when we can help you in person.  We welcome everyone to this service and want to help folks get up and running. Watch out though - you'll be learning stuff ;)
