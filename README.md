# setuptools

Tools for setting up computers routers and switches

## impi/set-ipmi-fans

Default settings on server motherboards are for 40mm fans.
This script changes the threshold to usable values for 120mm PWM fans (to stop the fans from ramping up and slowing down).

Requires ipmitool.

## routeros/load-routeros-config

Script for loading and applying a settings scripts for Mikrotik routers/switches (only RoutersOS, no SwitchOS).

example.rsc shows how the script should look. Warning: example.rsc is missing all setup for networking applying it will lock you out of the device (a reset to factory defaults is required).

Following command will apply settings.rsc to the router with factory default settings. scp/ssh works because admin user has no password.
```shell
./load-routeros-config settings.rsc admin@192.168.88.1
```
To apply new settings later, assign a ssh key to the defined user.

## routeros/set-routeros-tls

Script for uploading a certificate chain and key and enabling webfig over tls.
Only a certificate that is directly signed by the CA is supported (no sub CA). It is assumed the PKCS12 file has an empty password.
