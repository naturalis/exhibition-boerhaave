# Ansible Playbooks for Museum Boerhaave

#### Required playbooks
* softasap.sa-vnc-remote-desktop
* angstwad.docker_ubuntu
* wtanaka.teamviewer
install via
`ansible-galaxy install <playbook name>`

Also required
https://github.com/MakeExpose/atzedevries.boerhaave-exhibit
Clone the role in the role directory in this repo

#### Install boerhaave
`ansible-playbook -i <inventory> -b  playbook.yaml`

#### Install VNC
`ansible-playbook -i <inventory> -b  vnc.yaml`
