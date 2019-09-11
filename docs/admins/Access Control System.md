# Access Control System

## Project Goal

Setup access control system for SYN Shop that handles RFID access to the shop, as well as integrates security monitoring.

Initially the system will provide badge access to the front and back doors. Additionally an alarm system will have motion sensors, door sensors, and a glass shatter sensor. System will eventually be integrated with a camera system, but that will be handled as a different project.

## Purchasing

The following document was the bill of materials used impliment the access control system

[Access Control System BOM](https://docs.google.com/spreadsheet/ccc?key=0As-Fbiasxp7CdC1ZWXZZVzRoRzdycnZjV19ZVW5WMFE#gid=2)

## Adding Cards

SSH into the Electric Badger at 10.0.40.10, and connect to the screen session

    Linux electric-badger 4.1.13+ #826 PREEMPT Fri Nov 13 20:13:22 GMT 2015 armv6l
    
    The programs included with the Debian GNU/Linux system are free software;
    the exact distribution terms for each program are described in the
    individual files in /usr/share/doc/*/copyright.
    
    Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
    permitted by applicable law.
    
    To connect to the Electric Badger
    
     screen -x access/access
    
    Last login: Tue Sep 10 21:01:21 2019 from raven.local
    krux@electric-badger:~$ screen -x access/access

The screen session has a tab for a minicom session which interfaces to the serial interface of the badging system,
an access mailer tab, which handles sending out notices, and an optional working bash session.

Once connected to the screen session, press the key combination CTRL+a, and then " to select the minicom session.

    Num Name                                                                                                                        Flags
    
       0 minicom                                                                                                                         $
       1 access mailer                                                                                                                   $
       2 bash                                                                                                                            $

The '?' key and enter gives you a list of commands

    Valid commands are:
    (d)ate, (s)show user, (m)odify user <num>  <usermask> <tagnumber>
    (a)ll user dump,(r)emove_user <num>,(o)open door <num>
    (u)nlock all doors,(l)lock all doors
    (1)disarm_alarm, (2)arm_alarm,(3)train_alarm (9)show_status
    (t)ime set <sec 0..59> <min 0..59> <hour 0..23> <day of week 1..7>
               <day 0..31> <mon 0..12> <year 0.99>
    (e)nable <password> - enable or disable priveleged mode
    (h)ardware test - Test the hardware

Enter into enable mode

    e [enable_password]
    18:56:22  9/10/19 TUE Priveleged mode enabled.

Swipe the tag to be programmed on the badge reader

    18:56:22  9/10/19 TUE Priveleged mode enabled.
    18:57:23  9/10/19 TUE User A1B2C3D4 presented tag at reader 1
    18:57:23  9/10/19 TUE User not found
    18:57:24  9/10/19 TUE User  denied access at reader 1

Switch to the base session, or if it's not listed, create a new one by pressing CTRL+a, then c

In the scripts directory there is a file called users.txt.  This is a whitespace delimited text file
that contains the user ID, access level, badge number, name, email, and last verified date.

Find an open ID, set the access level to 254 for all access, and paste in the badge number that showed
in the logs when the badge was swiped.  Fill out the remaining fields and save the file

    #ID Access Badge Name_No_Spaces Drupal_name Email_address                                       Last Verified
    99 254 A1B2C3D4  Firstname_Lastname      "name@domain.com"                                       2019/10/09

Select and copy the first three fields, switch back to the minicom session, and add the user
to the badging controller by using the 'm' command followed by the user ID, access level, and
badge number.

    m 99 254 A1B2C3D4
    19:10:21  9/10/19 TUE User 7 successfully modified
    99      254     A1B2C3D4

Once that's done, test that the badge works.

## Revoking Cards

Switch to the bash session, and edit users.txt and find the badge to be deactivated.

Copy the line to the end of the file, and remark out the line, and add why it's being
deactivated and the current date, then save the file.

    #99 254 A1B2C3D4  Firstname_Lastname             "name@domain.com"                         Disabled 2019/10/09 - Canceled account

Switch to the minicom terminal and switch to enable mode.

    e [enable_password]
    18:56:22  9/10/19 TUE Priveleged mode enabled.

Remove the user with the 'r' command followed by the user ID

    r 99
    99 99     255     FFFFFFFF
    19:17:41  9/10/19 TUE User deleted at position 99


