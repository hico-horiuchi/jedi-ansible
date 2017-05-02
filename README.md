## Jedi Academy Ansible Playbooks

[![jedi-ansible.png](jedi-ansible.png?raw=true)](jedi-ansible.png?raw=true)

#### Preparations

    $ brew install git
    $ easy_install pip
    $ pip install virtualenv
    $ sudo gem install bundler
    $ git clone git@github.com:hico-horiuchi/jedi-ansible.git

#### Ansible

    $ cd jedi-ansible
    $ virtualenv venv
    $ source venv/bin/activate
    $ pip install -r requirements.txt
    $ rehash
    $ cp hosts_samples/hosts.conoha hosts
    $ vi ~/.vault_password
    $ ansible-playbook -i hosts site.yml

#### Serverspec

    $ cd jedi-ansible
    $ bundle install --jobs=4 --path=vendor/bundler --binstubs=vendor/bin
    $ bundle exec rake serverspec:all
