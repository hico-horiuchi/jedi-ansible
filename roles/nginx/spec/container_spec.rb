require 'spec_helper'

describe docker_container('nginx') do
  its(['HostConfig.NetworkMode']) { should eq property['docker_network'] }
  its(['HostConfig.PortBindings.80/tcp']) { should eq [{ 'HostIp' => '0.0.0.0', 'HostPort' => '80'}] }
  it { should exist }
  it { should be_running }
  it { should have_volume('/etc/nginx/sites-enabled', '/etc/docker/nginx') }
end
