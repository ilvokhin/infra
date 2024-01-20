Ansible playbooks for personal infrastructure.


INSTALL

$ python3 -m venv .env
$ source .env/bin/activate
$ pip3 install -r requirements.txt


RUN

$ ansible-playbook essential.yml
$ ansible-playbook web.yml


ROTATE VAULT PASSWORD

$ bin/rotate-vault-password.sh


REFERENCES

[1]: https://gitlab.archlinux.org/archlinux/infrastructure
