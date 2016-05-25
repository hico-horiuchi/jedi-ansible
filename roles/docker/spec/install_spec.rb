require 'spec_helper'

describe package('docker-engine') do
  it { should be_installed }
end

describe file('/etc/default/docker') do
  it { should be_file }
  it { should contain "DOCKER_OPTS=' -H tcp://0.0.0.0:#{property['remote_api_port']} -H unix:///var/run/docker.sock'" }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe command("ufw status | grep #{property['remote_api_port']}/tcp") do
  its(:stdout) { should match /#{property['remote_api_port']}\/tcp\s+ALLOW\s+Anywhere/ }
  its(:exit_status) { should eq 0 }
end

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end
