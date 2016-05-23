## Jedi Academy Ansible Playbooks

[![jedi-ansible.png](jedi-ansible.png?raw=true)](jedi-ansible.png?raw=true)

#### Usage

    $ brew install ansible git
    $ git clone git@github.com:hico-horiuchi/jedi-ansible
    $ cd jedi-ansible
    $ cp hosts_samples/hosts.jedi hosts
    $ ansible-playbook -i hosts site.yml
