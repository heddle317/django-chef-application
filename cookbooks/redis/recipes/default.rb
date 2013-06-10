#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "redis-install" do
    command "cd /srv;
             sudo wget http://download.redis.io/redis-stable.tar.gz;
             sudo tar xvzf redis-stable.tar.gz;
             cd redis-stable;
             sudo make;
             sudo cp redis-server /usr/local/bin/;
             sudo cp redis-cli /usr/local/bin/;"
    action :run
end

directory node['etc']['redis'] do
  owner "root"
  group "root"
  mode "0755"
end

directory node['var']['redis'] do
  owner "root"
  group "root"
  mode "0755"
end

directory "#{node['var']['redis']}/6379" do
  owner "root"
  group "root"
  mode "0755"
end

template "#{node['etc']['init.d']}/redis_6379" do
    source "redis_6379.erb"
    owner "root"
    group "root"
    mode "0755"
    action :create_if_missing
end

template "#{node['etc']['redis']}/6379.conf" do
    source "6379.conf.erb"
    owner "root"
    group "root"
    mode "0755"
    action :create_if_missing
end

execute "redis-start" do
    command "sudo update-rc.d redis_6379 defaults;
             sudo /etc/init.d/redis_6379 stop;
             sudo /etc/init.d/redis_6379 start;"
    action :run
end
