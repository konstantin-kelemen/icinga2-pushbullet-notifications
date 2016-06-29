#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and DEVID
arrUSERPAGER=(${USERPAGER//:/ })
APIKEY=${arrUSERPAGER[0]}
DEVID=${arrUSERPAGER[1]}

#The message title
TITLE="Icinga: $NOTIFICATIONTYPE $HOSTALIAS ($HOSTADDRESS)/$SERVICEDESC is $SERVICESTATE"

#The message body
BODY="* Notification Type: $NOTIFICATIONTYPE
* Service: $SERVICEDESC
* Host: $HOSTALIAS
* Address: $HOSTADDRESS
* State: $SERVICESTATE
* Date/Time: $LONGDATETIME
* Additional Info: $SERVICEOUTPUT
* Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Pushing it!
curl https://api.pushbullet.com/api/pushes -u $APIKEY: -d device_iden=$DEVID -d type=note --data-urlencode "title=$TITLE" --data-urlencode "body=$BODY" -X POST
