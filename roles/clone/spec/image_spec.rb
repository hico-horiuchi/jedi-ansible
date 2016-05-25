require 'spec_helper'

describe file('/tmp/docker/clone') do
  it { should be_directory }
  it { should be_mode 775 }
end

describe file('/tmp/docker/clone/Dockerfile') do
  it { should be_file }
  it { should be_mode 664 }
end

describe docker_image('jedi/clone') do
  its(['Config.Cmd']) { should eq ['nginx'] }
  its(['Config.WorkingDir']) { should eq '/etc/nginx' }
  it { should exist }
end
