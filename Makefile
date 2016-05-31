HOST = tcp://jedi.hico.io:4750

build:
	ansible-playbook -i hosts site.yml

test:
	bundle install --jobs=4 --path=vendor/bundler --binstubs=vendor/bin
	bundle exec rake serverspec:all

clean:
	DOCKER_HOST=$(HOST) docker kill `docker ps -aq`
	DOCKER_HOST=$(HOST) docker rm `docker ps -aq`
