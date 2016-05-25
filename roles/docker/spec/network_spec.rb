require 'spec_helper'

describe command("docker network inspect #{property['docker_network']}") do
  its(:stdout) { should contain '"Driver": "bridge"' }
  its(:exit_status) { should eq 0 }
end
