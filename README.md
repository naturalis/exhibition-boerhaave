# exhibition-boerhaave

## Ansible

We use Ansible to perform a one-off deployment of Docker images on about 66
Linux devices in the exhibition of Rijksmuseum Boerhaave.

### Roles

We use the following roles:

* boerhaave.exhibit
* [teamviewer](https://github.com/AtzeDeVries/ansible-role-teamviewer)

Clone these repositories into the ansible/roles subdirectory.

### Vault

Secrets are stored using Ansible vault. You can provide the vault password on
the command line, for example:
`ansible -i ansible/hosts all -m ping --ask-vault-pass`

You can also store the vault password in a file and run commands like this:
`ansible -i ansible all -m ping --vault-password-file ~/.vault_pass.txt`

Check more details about how to use vault [in the upstream
documentation](http://docs.ansible.com/ansible/latest/playbooks_vault.html)
