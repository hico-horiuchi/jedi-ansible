require 'spec_helper'

describe command('ufw status | grep 10000/tcp') do
  its(:stdout) { should match /10000\/tcp\s+ALLOW\s+Anywhere/ }
  its(:exit_status) { should eq 0 }
end
