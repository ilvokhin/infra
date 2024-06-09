Ansible playbooks for personal infrastructure.


INSTALL

$ python3 -m venv .env
$ source .env/bin/activate
$ pip3 install -r requirements.txt


RUN

Use master playbook to setup everything in one go.

$ ansible-playbook master.yml

Alternatively use specific playbook to setup only part of the system.

$ ansible-playbook essential.yml
$ ansible-playbook web.yml
$ ansible-playbook mail.yml
$ ansible-playbook vpn.yml


DOTFILES

There are currently no secrets stored in dotfiles, therefore it is possible to
install dotfiles to localhost without decrypting Ansible Vault.

$ touch /tmp/ansible.cfg
$ ANSIBLE_CONFIG=/tmp/ansible.cfg \
    ansible-playbook dotfiles.yml \
    --extra-vars "user=`whoami`"


ROTATE VAULT PASSWORD

$ bin/rotate-vault-password.sh


REFERENCES

[1]: https://gitlab.archlinux.org/archlinux/infrastructure
