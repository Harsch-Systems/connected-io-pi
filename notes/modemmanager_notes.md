## Setup ModemManager and NetworkManager for the ConnectedIO EM1000T-VZ-CAT1 modem on Raspberry Pi

### (Update February 2022: Instructions below only work on Bullseye or newer Raspberry Pi OS (old backports workaround has been removed)

1.) Install NetworkManager
```
sudo apt install network-manager
```

2.) Configure NetworkManager for any wifi connections

(use menu system to specify wifi network SSID and password)
```
sudo nmtui
```

3.) Install ModemManager (may already be installed from step 1)
```
sudo apt install modemmanager
```

4.) Create a NetworkManager connection for the modem

(Verizon static IP example)
```
sudo nmcli con add type gsm ifname '*' con-name 'verizonstatic' apn 'we01.vzwstatic' connection.autoconnect yes
```

(Verizon dynamic IP example)
```
sudo nmcli con add type gsm ifname '*' con-name 'verizon' apn 'vzwinternet' connection.autoconnect yes
```

5.) Disable dhcpcd.service
```
sudo systemctl disable dhcpcd
```

6.) Disable networking.service
```
sudo systemctl disable networking
```

7. Enable NetworkManager
```
sudo systemctl enable NetworkManager
```

Reboot and see if wwan0 autoconnects

Use 'nmcli con status' to check connections
