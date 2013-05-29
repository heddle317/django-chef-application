#
# Cookbook Name:: django-application
# Recipe:: custom_installation
#
# Author:: Kate Heddleston (<kate.heddleston@gmail.com>)
#
# Copyright 2009-2011, Opscode, Inc.
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
directory node['projects-external']['dir'] do
  owner "root"
  group "root"
  mode "0755"
end

directory node['django-registration']['dir'] do
  owner "root"
  group "root"
  mode "0755"
end

git node['django-registration']['dir'] do
    repository node['git']['django-registration']
    reference "master"
    action :sync
end

execute "django-registration-install" do
    command "cd /srv/django-external/django-registration/;
             sudo python setup.py install"
    action :run
end
