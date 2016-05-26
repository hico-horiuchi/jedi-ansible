## Jedi Academy Ansible Playbooks

[![jedi-ansible.png](jedi-ansible.png?raw=true)](jedi-ansible.png?raw=true)

#### Preparations

    $ brew install ansible git
    $ sudo gem install bundler
    $ git clone git@github.com:hico-horiuchi/jedi-ansible

#### Ansible

    $ cd jedi-ansible
    $ cp hosts_samples/hosts.jedi hosts
    $ ansible-playbook -i hosts site.yml

#### Serverspec

    $ cd jedi-ansible
    $ bundle install --jobs=4 --path=vendor/bundler --binstubs=vendor/bin
    $ bundle exec rake serverspec:all
