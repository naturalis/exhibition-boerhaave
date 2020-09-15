# Ansible

We use [Ansible](https://github.com/naturalis/exhibition-boerhaave/tree/master/ansible)
to perform a one-off deployment of interactives on about 60 Linux devices in the
exhibition of [Rijksmuseum Boerhaave](https://rijksmuseumboerhaave.nl/).

## Requirements

1. Ansible [installed locally](http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu).

2. [Install](https://git-scm.com/download/linux) git

3. Clone this repo locally. For instance:

   ```bash
   git clone https://github.com/naturalis/exhibition-boerhaave ~/code/exhibition-boerhaave
   ```

4. Clone alle role repositories into the `ansible/roles` subdirectory. For instance:

   ```bash
   git clone https://gitlab.com/naturalis/mii/boerhaave/ansible-boerhaave-exhibit \
   ~/code/exhibition-boerhaave/ansible/roles/atzedevries.boerhaave-exhibit
   ```

5. Install all playbooks. For instance:

   ```bash
   ansible-galaxy install <playbook name>
   ```

## Required roles

We use the following roles:

* [boerhaave-exhibit](https://gitlab.com/naturalis/mii/boerhaave/ansible-boerhaave-exhibit)
* [teamviewer](https://github.com/wtanaka/ansible-role-teamviewer)
* [wakeuponlan](https://github.com/AtzeDeVries/atzedevries.wakeuponlan)
* [reboot](https://github.com/AtzeDeVries/atzedevries.reboot)

## Required playbooks

We use the following playbooks:

* softasap.sa-vnc-remote-desktop
* wtanaka.teamviewer

## Vault

Secrets are stored using [Ansible vault](http://docs.ansible.com/ansible/latest/playbooks_vault.html).

* You can provide the vault password on the command line, for example:

  ```bash
  ansible -i ansible/hosts all -m ping --ask-vault-pass
  ```

* You can also store the vault password in a file and run commands like this:

  ```bash
  ansible -i ansible all -m ping --vault-password-file ~/.vault_pass.txt
  ```

Check more details about how to use vault [in the upstream
documentation](http://docs.ansible.com/ansible/latest/playbooks_vault.html)
