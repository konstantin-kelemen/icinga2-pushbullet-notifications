# icinga2-pushbullet-notifications

Pusbullet notification scripts for Icinga 2 with useful code snippets

## How to use:

Copy the provided .sh files to your Icinga2/scripts directory.

Merge the contents of the config files in conf.d with those you have.

Take a closer look at the notifications.conf, by default the notifications are sent to users in the "noc" group.

In case you use Director plugin for Icinga Web 2 you should do the following steps this work:

Create a group:
![alt tag](http://i.imgur.com/Ln2WCa4.png)

Create a user template:
![alt tag](http://i.imgur.com/QqbS8SP.png)

Create a user and specify your Pushbullet API key and your device ID with a colon between them in the Pager field:
![alt tag](http://i.imgur.com/XbZa0M0.png)

Delpoy your config and you're done!
