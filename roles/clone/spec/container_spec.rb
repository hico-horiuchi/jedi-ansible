require 'spec_helper'

property['clone_numbers'].each do |item|
  describe docker_container("clone-#{item}") do
    its(['HostConfig.NetworkMode']) { should eq property['docker_network'] }
    it { should exist }
    it { should be_running }
    it { should have_volume('/etc/nginx/sites-enabled', '/etc/docker/clone') }
    it { should have_volume('/var/www/html', "/var/docker/clone-#{item}") }
  end
end
