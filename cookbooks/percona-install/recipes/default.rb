# Cookbook Name:: percona-install
# Recipe:: default
#
# Copyright 2011-2012, CustomInk, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node["platform"]
when "redhat","centos","fedora","suse", "amazon", "scientific"
  arch = node["kernel"]["machine"]
  arch = "i386" unless arch == "x86_64"
  
  rpm_file = "percona-release-0.0-1.#{arch}.rpm"

  remote_file "/var/tmp/#{rpm_file}" do
    source "http://www.percona.com/downloads/percona-release/#{rpm_file}"
    owner  "root"
    mode   0644
  end

  package "percona-release" do
    source "/var/tmp/#{rpm_file}"
    options "--nogpgcheck"
  end

when "debian","ubuntu"
  
  execute "key-install" do
	  command "gpg --keyserver  hkp://keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A | gpg -a --export CD2EFD2A | apt-key add -; apt-get update"
	end

	template "/etc/apt/sources.list.d/percona_repo.list" do
      source "percona_repo.list.erb"
	  owner "root"
	  group "root"
	  mode "0644"
	  notifies :run, resources(:execute => "key-install"), :immediately
	end
end
