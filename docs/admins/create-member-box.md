# Create a member container

All admins need to verify that applicants are paying members in good standing.  Members need to provide admins an SSH key.  

## SSH Key file

Please name the SSH key with a valid member name on synshop.org followed by `-box`, eg `krux-box`.  Edit the comment of the key to be the current email of the member, eg:

```
ssh-ed25519 AAAAC3NzaC[SNIP]stbch8XfLn3rfR krux@synshop.org
```

## Prep for creation

Log into the provisioner account on the c220 (`provisioner@10.0.40.50`) and create a file in `~/lxd/member.keys` with the public SSH key.  Be sure to use the nomenclature denoted above (eg `krux-box`).

Then list all the containers with `lxc list -c n,s,4,6`.  Note the highest IP and pick the next free one.  In this case, it'd be `10.0.40.60`:

```
provisioner@c220-01:~/lxd$ lxc list -c n,s,4,6
+------------+---------+--------------------------------+------+
|    NAME    |  STATE  |              IPV4              | IPV6 |
+------------+---------+--------------------------------+------+
| chen-box   | RUNNING | 10.0.40.56 (eth0)              |      |
+------------+---------+--------------------------------+------+
| jed-box    | RUNNING | 10.0.40.58 (eth0)              |      |
+------------+---------+--------------------------------+------+
| nexus      | RUNNING | 10.0.40.52 (eth0)              |      |
|            |         | 10.0.40.131 (eth0)             |      |
+------------+---------+--------------------------------+------+
| vic-box    | RUNNING | 10.0.40.59 (eth0)              |      |
+------------+---------+--------------------------------+------+
```

## Create the container

Now that you know the IP and have the SSH key file created, ensure you're in the `lxd` directory and run the create command:

```
provisioner@c220-01:~/lxd$ pwd
/home/provisioner/lxd

./create.member.box.sh krux-box 10.0.40.60 10.0.40.1 member.keys/krux-box
```

This signature breaks down to the following:

```
create.member.box.sh $NAME $IP $GATEWAY $KEY_FILE
```

## Notify the user

When the script is done it will give you some text to send the user:

```
Have the owner of member.keys/krux-box try this from outside the shop:

  ssh krux-box@nexus.synshop.org

And inside the shop this:

  ssh ubuntu@10.0.40.60
```

Copy this from the terminal and send it to the user!

## List of boxes

here's a list as of Jun 2018:

```
mrjones@c220-01:~$ lxc list -c n4 --format table
+-------------+--------------------------------+
|    NAME     |              IPV4              |
+-------------+--------------------------------+
| austin-box  | 10.0.40.64 (eth0)              |
+-------------+--------------------------------+
| chen-box    | 10.0.40.56 (eth0)              |
+-------------+--------------------------------+
| claylj-box  | 10.0.40.63 (eth0)              |
+-------------+--------------------------------+
| david-box   | 10.0.40.60 (eth0)              |
+-------------+--------------------------------+
| flatline    | 10.0.40.20 (eth0)              |
+-------------+--------------------------------+
| forge-box   | 10.0.40.62 (eth0)              |
+-------------+--------------------------------+
| jed-box     | 10.0.40.58 (eth0)              |
+-------------+--------------------------------+
| mbrowne-box | 10.0.40.61 (eth0)              |
+-------------+--------------------------------+
| motioneye   | 10.0.40.21 (eth0)              |
+-------------+--------------------------------+
| motioneye2  | 10.0.40.22 (eth0)              |
+-------------+--------------------------------+
| nexus       | 10.0.40.52 (eth0)              |
|             | 10.0.40.131 (eth0)             |
+-------------+--------------------------------+
| pihole      | 10.0.40.54 (eth0)              |
+-------------+--------------------------------+
| pritunl     | 192.168.232.1 (tun5)           |
|             | 192.168.220.1 (tun7)           |
|             | 10.0.40.57 (eth0)              |
+-------------+--------------------------------+
| stubby      | 10.0.40.53 (eth0)              |
+-------------+--------------------------------+
| unifi       | 10.0.40.55 (eth0)              |
+-------------+--------------------------------+
| vic-box     | 10.0.40.59 (eth0)              |
+-------------+--------------------------------+
```