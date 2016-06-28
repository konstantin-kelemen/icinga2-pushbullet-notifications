#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and DEVID
arrUSERPAGER=(${USERPAGER//:/ })
APIKEY=${arrUSERPAGER[0]}
DEVID=${arrUSERPAGER[1]}

#Here we have an urlencode function found on http://stackoverflow.com/a/10797966
urlencode() {
    local data
    if [[ $# != 1 ]]; then
        echo "Usage: $0 string-to-urlencode"
        return 1
    fi
    data="$(curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "$1" "")"
    if [[ $? != 3 ]]; then
        echo "Unexpected error" 1>&2
        return 2
    fi
    echo "${data##/?}"
    return 0
}

#The message body
BODY="* Notification Type: $NOTIFICATIONTYPE
* Service: $SERVICEDESC
* Host: $HOSTALIAS
* Address: $HOSTADDRESS
* State: $SERVICESTATE
* Date/Time: $LONGDATETIME
* Additional Info: $SERVICEOUTPUT
* Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Here we encode the messaage body
ENCODEDBODY=`urlencode "$BODY"`

#And push it!
curl https://api.pushbullet.com/api/pushes -u $APIKEY: -d device_iden=$DEVID -d type=note -d title="Icinga: $NOTIFICATIONTYPE $HOSTALIAS ($HOSTADDRESS)/$SERVICEDESC is $SERVICESTATE" -d body="$ENCODEDBODY" -X POST
