# Cookbook Name:: percona-install
# Recipe:: monitoring
#
# Copyright 2012, CX Inc.
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
# http://www.percona.com/downloads/percona-monitoring-plugins/percona-monitoring-plugins-0.9.0.tar.gz
default['percona-install']['plugins_url'] = "http://www.percona.com/downloads/percona-monitoring-plugins/"
default['percona-install']['plugins_version'] = "0.9.0"
default['percona-install']['plugins_sha'] = "04a7ace4c345ddc2a6b26cae0f6252533663d809008f284919b207b9a00e4a44"
default['percona-install']['plugins_path'] = "/opt/pmp"
default['percona-install']['plugins_nagios'] = "/opt/pmp/nagios/bin"
