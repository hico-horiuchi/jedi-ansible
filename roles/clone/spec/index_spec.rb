require 'spec_helper'

property['clone_numbers'].each do |item|
  describe file("/var/docker/clone-#{item}") do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file("/var/docker/clone-#{item}/index.html") do
    it { should be_file }
    it { should be_mode 644 }
    it { should contain "<title>Clone #{item} | Jedi Academy</title>" }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
