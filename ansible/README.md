# Ansible Playbooks for Museum Boerhaave

#### Required playbooks
* softasap.sa-vnc-remote-desktop
* angstwad.docker_ubuntu
install via
`ansible-galaxy install <playbook name>`

Also required
https://github.com/AtzeDeVries/ansible-role-teamviewer
https://github.com/MakeExpose/atzedevries.boerhaave-exhibit

Clone the roles in the role directory directory as `wtanaka.teamviewer`
`git clone https://github.com/AtzeDeVries/ansible-role-teamviewer wtanaka.teamviewer`

#### Install boerhaave
`ansible-playbook -i <inventory> -b  playbook.yaml`

#### Install VNC
`ansible-playbook -i <inventory> -b  vnc.yaml`
