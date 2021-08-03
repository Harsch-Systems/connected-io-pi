# connected-io-pi
Get Raspberry Pi to connect to 4G LTE Cat1 Cellular using ConnectedIO modem

## Available modem modes of operation
The EM1000T-VZ-CAT1 modem can be set to run in either AT command mode (AT#USBCFG=0) or MBIM mode (AT#USBCFG=3 or 5)
If you're just starting out, we suggest MBIM mode (AT#USBCFG=3 with ModemManager/NetworkManager see below)

## Linux network initialization/operation options
The Raspberry Pi (as of Buster 12/2020 release) uses a hybrid network configuration/management model
that uses old Debian networking (/etc/network/interfaces) and dhcpcd (both configured to run as systemd services).
It does not come configured for systemd-networkd or NetworkManager (2 of the other ways of doing Linux networking).

The 2 ways we've been able to get this modem to work on the pi are:
1. Using /etc/network/interfaces and specifying an 'up' script in the manual configuration stanza, and
2. Using ModemManager (1.14.0 or higher) and NetworkManager

At the time of this writing, Number 1 is the method recommended and supported by ConnectedIO, wheras Number 2 is recommended here (by us).
Either of the modem modes can be made to work in either of these scenarios, but we recommend AT mode for Number 1 and MBIM mode
for Number 2.

## Next Steps
For a recipe to configure /etc/network/interfaces using the modem in AT command mode, install ['StartDataCM4NA.sh'](scripts/StartDataCM4NA.sh) and ['at.sh'](scripts/at.sh) scripts
and use 'interfaces.txt' as a guide for your entry in /etc/network/interfaces.  Note: the above scripts may require tweaking (e.g. install ppp package to gain 'chat' command)

For a recipe to configure ModemManager and NetworkManager with the modem in MBIM mode, see [this file](notes/modemmanager_notes.md)
