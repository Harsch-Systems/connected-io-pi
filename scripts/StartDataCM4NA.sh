
PDP='3'

# Activate the NCM
at.sh "at#ncm=1,$PDP"

sleep 1s

# Activate the PDP context
at.sh "at+cgact=1,$PDP" 

sleep 1s

# Activate the data connection
at.sh "at+cgdata=\"M-RAW_IP\",$PDP"

sleep 1s

IPaddr=`at.sh at+cgpaddr=$PDP | grep '+CGPADDR:' | cut -d" " -f2 | cut -d \" -f2`
# NetMsk=`at.sh at+cgcontrdp=$PDP | grep '+CGCONTRDP:' | cut -d" " -f2 | cut -d, -f4 | cut -b 16-2$
GW=`at.sh at+cgcontrdp=$PDP | grep '+CGCONTRDP:' | cut -d" " -f2 | cut -d, -f5 | cut -d \" -f2`
DNS=`at.sh at+cgcontrdp=$PDP | grep '+CGCONTRDP:' | cut -d" " -f2 | cut -d, -f6 | cut -d \" -f2`

sudo ifconfig wwan0 $IPaddr 

sleep 2s

sudo route add default gw $GW

sleep 2s

sudo arp -s $GW 00:00:11:12:13:14

sleep 2s
