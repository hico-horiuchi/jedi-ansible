require 'spec_helper'

describe file('/tmp/docker/nginx') do
  it { should be_directory }
  it { should be_mode 775 }
end

describe file('/tmp/docker/nginx/Dockerfile') do
  it { should be_file }
  it { should be_mode 664 }
end

describe docker_image('jedi/nginx') do
  its(['Config.Cmd']) { should eq ['nginx'] }
  its(['Config.WorkingDir']) { should eq '/etc/nginx' }
  it { should exist }
end
