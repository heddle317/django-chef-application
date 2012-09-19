# <a name="title"></a> percona-install [![Build Status](https://secure.travis-ci.org/customink-webops/percona-install.png)](http://travis-ci.org/customink-webops/percona-install)

Description
===========

This cookbook installs the percona-release apt or yum repository and allows you to install the client and/or server. A recipe is also included for the Percona Monitoring Plugins.

More info:  
  * http://www.percona.com/docs/wiki/percona-server:release:start
  * http://www.percona.com/software/percona-monitoring-plugins/
  * http://www.percona.com/software/percona-xtrabackup/
  * http://www.percona.com/software/percona-toolkit/


Requirements
============

none

Attributes
==========

These attributes are used by the monitoring recipe:

* `node['percona-install']['plugins_url']` - The base URL for the percona-monitoring-plugins
* `node['percona-install']['plugins_version']` - The version of plugins to be installed
* `node['percona-install']['plugins_sha']` - The sha of the downloaded tar gzip file.
* `node['percona-install']['plugins_path']` - The directory in which the plugins will be installed
* `node['percona-install']['plugins_nagios']` - The directory in which the nagios plugins will be installed

Recipes
=======

* default    - Installs percona-release apt or yum repository
* client     - Installs Percona client
* server     - Installs Percona server
* xtrabackup - Installs Percona xtrabackup
* monitoring - Installs Percona monitoring plugins
* toolkit    - Installs Percona toolkit

Usage
=====

Include the percona recipe to install the percona-release apt or yum repository

    include_recipe "percona-install"

Or add it to your role, or directly to a node's recipes.



Include the percona-install::client recipe to install the percona client

    include_recipe "percona-install::client"

Or add it to your role, or directly to a node's recipes.


Include the percona-install::server recipe to install the percona server

    include_recipe "percona-install::server"

Or add it to your role, or directly to a node's recipes.

Include the percona-install::xtrabackup recipe to install percona xtrabackup

    include_recipe "percona-install::xtrabackup"

Or add it to your role, or directly to a node's recipes.

Include the percona-install::monitoring recipe to install the percona monitoring tools

    include_recipe "percona-install::monitoring"

Or add it to your role, or directly to a node's recipes.

Include the percona-install::toolkit recipe to install percona toolkit

    include_recipe "percona-install::toolkit"

Or add it to your role, or directly to a node's recipes.

License and Authors
===================

Author:: Nathen Harvey <nharvey@customink.com>  
Author:: Miah Johnson <miah@chia-let.org>  
Author:: Jef Mathiot <jeff.mathiot@gmail.com>
Author:: Michael H. Oshita <ijinpublic+github@gmail.com>

Copyright 2011-2012, CustomInk, LLC  
Copyright 2012, CX Inc.  

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


