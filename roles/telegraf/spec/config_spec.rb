require 'spec_helper'

property['clone_numbers'].each do |item|
  describe file("/etc/docker/telegraf-#{item}") do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file("/etc/docker/telegraf-#{item}/telegraf.conf") do
    it { should be_file }
    it { should contain "urls = \[\"http:\/\/clone-#{item}\/server_status\"\]" }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
