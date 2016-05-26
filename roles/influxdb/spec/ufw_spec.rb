require 'spec_helper'

%w(8083 8086).each do |item|
  describe command("ufw status | grep #{item}/tcp") do
    its(:stdout) { should match /#{item}\/tcp\s+ALLOW\s+Anywhere/ }
    its(:exit_status) { should eq 0 }
  end

  describe port(item) do
    it {  should be_listening.on('::').with('tcp6') }
  end
end
