node {
    stage 'checkout'
    git url: 'git://github.com/hico-horiuchi/jedi-ansible.git'
    sh 'cp hosts_samples/hosts.jedi hosts'

    stage 'common'
    sh 'ansible-playbook -i hosts -t common site.yml'

    stage 'docker'
    sh 'ansible-playbook -i hosts -t docker site.yml'

    stage 'web'
    parallel 'clone': {
        node { sh 'ansible-playbook -i hosts -t clone site.yml' }
    }, 'nginx': {
        node { sh 'ansible-playbook -i hosts -t nginx site.yml' }
    }

    stage 'monitoring'
    parallel 'influxdb': {
        node { sh 'ansible-playbook -i hosts -t influxdb site.yml' }
    }, 'telegraf': {
        node { sh 'ansible-playbook -i hosts -t telegraf site.yml' }
    }, 'chronograf': {
        node { sh 'ansible-playbook -i hosts -t chronograf site.yml' }
    }

    stage 'serverspec'
    sh 'bundle install --jobs=4 --path=vendor/bundler --binstubs=vendor/bin'
    // sh 'bundle exec rake serverspec:all'
}
