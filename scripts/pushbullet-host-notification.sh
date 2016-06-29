#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and DEVID
arrUSERPAGER=(${USERPAGER//:/ })
APIKEY=${arrUSERPAGER[0]}
DEVID=${arrUSERPAGER[1]}

#The message title
TITLE="Icinga: $NOTIFICATIONTYPE $HOSTALIAS ($HOSTADDRESS) is $HOSTSTATE"

#The message body
BODY="* Host: $HOSTALIAS
* Address: $HOSTADDRESS
* State: $HOSTSTATE
* Date/Time: $LONGDATETIME
* Additional Info: $HOSTOUTPUT
* Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Pushing it!
curl https://api.pushbullet.com/api/pushes -u $APIKEY: -d device_iden=$DEVID -d type=note --data-urlencode "title=$TITLE" --data-urlencode "body=$BODY" -X POST
