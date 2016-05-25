require 'spec_helper'

describe command('ufw status | grep 80/tcp') do
  its(:stdout) { should match /80\/tcp\s+ALLOW\s+Anywhere/ }
  its(:exit_status) { should eq 0 }
end
