# Network

All network devices used in the exhibition receive their ip address, via our dhcp server. This ip address is linked to the mac address and is managed through a reservation on our firewall.
We automated the procedure to add new reservations using a simple ruby script that transforms [dhcp.yaml](https://github.com/naturalis/exhibition-boerhaave/blob/master/network/dhcp.yaml) to a .conf file, containing developer shell commands that our firewall can read.
For instance:
```
$ ruby creator.rb dhcp.yaml > master.conf
```
Then we apply this .conf file on the firewall:
```
$ ssh root@<ip> '/usr/local/sbin/pfSsh.php' < master.conf
```
