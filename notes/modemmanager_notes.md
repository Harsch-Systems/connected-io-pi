## Setup ModemManager and NetworkManager for the ConnectedIO EM1000T-VZ-CAT1 modem on Raspberry Pi

The version of ModemManager that ships with Raspberry Pi OS (1.10) doesn't appear to work with the Telit LE910 V2
in MBIM mode (AT#USBCFG=3) and so we must upgrade to a newer version (1.14).  Thankfully, that is available via
the debian backports repository.

0. Add this line to /etc/apt/sources.list
```
deb http://deb.debian.org/debian buster-backports main
```

1. Download and install the Debian repo key package
```
wget http://deb.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2021.1.1_all.deb
sudo dpkg -i debian-archive-keyring_2021.1.1_all.deb
sudo apt update
```

2. Install the new ModemManager package
```
sudo apt install -t buster-backports modemmanager
```

3. Disable dhcpcd.service
```
sudo systemctl disable dhcpcd
```

4. Disable networking.service
```
sudo systemctl disable networking
```

5. Install NetworkManager
```
sudo apt install network-manager
```

6. Enable NetworkManager
```
sudo systemctl enable NetworkManager
```

7. Create a NetworkManager connection for the modem

(Verizon static IP example)
```
sudo nmcli con add type gsm ifname '*' con-name 'verizonstatic' apn 'we01.vzwstatic' connection.autoconnect yes
```

(Verizon dynamic IP example)
```
sudo nmcli con add type gsm ifname '*' con-name 'verizon' apn 'vzwinternet' connection.autoconnect yes
```

8.) Configure NetworkManager for any wifi connections that got disabled in step 3/4

(use menu system to specify wifi network SSID and password)
```
sudo nmtui
```

Reboot and see if wwan0 autoconnects

Use 'nmcli con status' to check connections
