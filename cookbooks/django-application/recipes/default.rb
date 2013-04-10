#
# Cookbook Name:: webserver-application
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create a 2.6 virtualenv owned by ubuntu user
# python_virtualenv "/home/ubuntu/flask_ve" do
#     owner "root"
#     group "sysadmins"
#     action :create
# end

# install Django 1.5.1
python_pip "django" do
    version "1.5.1"
    action :install
end

python_pip "simplejson" do
    action :install
end

python_pip "pytz" do
    action :install
end

python_pip "distribute" do
    action :install
end

python_pip "wsgiref" do
    action :install
end

packages = Array.new

packages |= %w/
    python-psycopg2
/

packages.each do |pkg|
    package pkg do
        action [:install, :upgrade]
    end
end
