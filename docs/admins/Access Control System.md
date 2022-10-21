# Access Control System

## Project Goal

Setup access control system for SYN Shop that handles RFID access to the shop, as well as integrates security monitoring.

Initially the system will provide badge access to the front and back doors. Additionally an alarm system will have motion sensors, door sensors, and a glass shatter sensor. System will eventually be integrated with a camera system, but that will be handled as a different project.

## Purchasing

The following document was the bill of materials used impliment the access control system

[Access Control System BOM](https://docs.google.com/spreadsheet/ccc?key=0As-Fbiasxp7CdC1ZWXZZVzRoRzdycnZjV19ZVW5WMFE#gid=2)


## A note about `screen` and `minicom`

`screen` is used with the `access` account to talk over the serial port (usb <-> serial) with `minicom`. Let's break that down:

* `screen` - an app that [allows you to connect](https://en.wikipedia.org/wiki/GNU_Screen) to a long lived terminal. 
* `minicom` - a terminal emulator that [allows you to talk to serial devices](https://en.wikipedia.org/wiki/Minicom) like the Open Access v3 MEGA, Kit
* `access` - a user account on the Raspberry Pi where we run both `screen` and `minicom`

Given that the `screen` session is persistent, you need to always `su` to the `access` user.  Then you need to connect
to the existing screen session with `screen -r minicom`.

**NOTE:** - When you're done with `screen` type `ctrl + a` then `d`.  This will detach from the session, but
keep it running.

If you're concerned you messed something up, just run `sudo reboot` to reboot the whole Pi, and it should all be fixed.

## Adding Cards

Go to the outside access pannel and swipe the new, unprovisioned badge. An email will be 
sent to `monitoring@synshop.org` with the decimal and hex of the unauthorized badge.

SSH into the Electric Badger at 10.0.40.10, and connect to the screen session

    ssh 10.0.40.10
    mrjones@electric-badger-1:~ $ sudo su - access
    access@electric-badger-1:~ $ screen -r minicom

Once connected to the screen session, press the `?` key and enter gives you a list of commands:

    Valid commands are:
    (d)ate, (s)show user, (m)odify user <num>  <usermask> <tagnumber>
    (a)ll user dump,(r)emove_user <num>,(o)open door <num>
    (u)nlock all doors,(l)lock all doors
    (1)disarm_alarm, (2)arm_alarm,(3)train_alarm (9)show_status
    (t)ime set <sec 0..59> <min 0..59> <hour 0..23> <day of week 1..7>
               <day 0..31> <mon 0..12> <year 0.99>
    (e)nable <password> - enable or disable priveleged mode
    (h)ardware test - Test the hardware

Enter into enable mode with `e`. The password is in Systems keepass under "Access Control RaspberryPi SSH (electric-badger)":

    e [enable_password]
    18:56:22  9/10/19 TUE Priveleged mode enabled.

Open `/home/access/logs_and_users/users.txt` with your favorite editor.  It is a CSV  file
that contains all the users.  Find an open `ID`, set the access level to `254` for all access, 
and paste in the badge decimal and hexadecimal that showed
in the email when the badge was swiped.  Fill out the remaining fields and save the file

Here's the headers with a sample row:

    "ID","level","badge","name","handle","color","email","Last_Verified","Last_Badged","decimal"
    "3","253","A1B2C3D4","new_user","New User McGee","#ff7070,#000000","new@user.com","2020-01-04","2022-09-17","1811700"

Save the file and exit the editor.

Using `screen -r minicom`, and add the user
to the badging controller by using the `m` command followed by the user ID, access level, and
decimal badge number.

    m 3 254 1811700
    19:10:21  9/10/19 TUE User 7 successfully modified
    3      254     1811700

When you're done with `screen` type `ctrl + a` then `d` to detach from screen.

Once that's done, test that the badge works.

## Revoking Cards

Switch to the bash session, and edit users.txt and find the badge to be deactivated.

Copy the line to `disabled.users.txt` remove the line from `users.txt`. Add why it's being
deactivated and the current date, then save the file.

    #99 254 1811700  Firstname_Lastname             "name@domain.com"                         Disabled 2019/10/09 - Canceled account

Using `screen -r minicom`, switch to enable mode.

    e [enable_password]
    18:56:22  9/10/19 TUE Priveleged mode enabled.

Remove the user with the `r` command followed by the user ID:

    r 99
    99 99     255     FFFFFFFF
    19:17:41  9/10/19 TUE User deleted at position 99

When you're done with `screen` type `ctrl + a` then `d` to detach from screen.


## About Decimal vs Hexidecimal for badges

The badge reader doesn't give us the full RFID, it rather reads the last 31 bits and a parity bit

```
proxmark3> lf search
NOTE: some demods output possible binary
  if it finds something that looks like a tag
False Positives ARE possible


Checking for known tags:

EM410x pattern found:

EM TAG ID      : 38001BA4F4

Possible de-scramble patterns
Unique TAG ID  : 1C00D8252F
HoneyWell IdentKey {
DEZ 8          : 01811700
DEZ 10         : 0001811700
DEZ 5.5        : 00027.42228
DEZ 3.5A       : 056.42228
DEZ 3.5B       : 000.42228
DEZ 3.5C       : 027.42228
DEZ 14/IK2     : 00240519980276
DEZ 15/IK3     : 000120273249583
DEZ 20/ZK      : 01120000130802050215
}
Other          : 42228_027_01811700
Pattern Paxton : 942662388 [0x382FE2F4]
Pattern 1      : 5126429 [0x4E391D]
Pattern Sebury : 42228 27 1811700  [0xA4F4 0x1B 0x1BA4F4]

Valid EM410x ID Found!


38001BA4F4 = 00111000 00000000 00011011 10100100 11110100
```

Based on that we can calcuate the tag number read by the reader:

```
 discarded  tag number
[001110000][0000000000110111010010011110100][parity]
            0000000000110111010010011110100  1
```

If even number of bits in tag number parity is `1`, otherwise parity is `0`

```
00000000 00110111 01001001 11101001 = 003749e9
```

All leading zeros are discarded

So our tag number is `3749e9`
