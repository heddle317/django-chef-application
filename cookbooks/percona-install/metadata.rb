maintainer       "CustomInk, LLC"
maintainer_email "nharvey@customink.com"
license          "Apache 2.0"
description      "Installs Percona apt/yum repostiory, client, and server"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.4"

recipe           "default", "Installs percona-release apt or yum repository"
recipe           "client", "Installs Percona client"
recipe           "server", "Installs Percona server"
recipe           "xtrabackup", "Installs Percona xtrabackup"
recipe           "monitoring", "Installs Percona monitoring plugins"
recipe           "toolkit", "Installs Percona toolkit"

attribute "percona-install/plugins_url", 
  :dislpay_name => "Percona Install - Plugins URL",
  :description => "The base URL for the percona-monitoring-plugins",
  :type => "string"

attribute "percona-install/plugins_version", 
  :dislpay_name => "Percona Install - Plugins Version",
  :description => "The version of plugins to be installed",
  :type => "string"

attribute "percona-install/plugins_sha", 
  :dislpay_name => "Percona Install - Plugins SHA",
  :description => "The sha of the downloaded tar gzip file.",
  :type => "string"

attribute "percona-install/plugins_path", 
  :dislpay_name => "Percona Install - Plugins Path",
  :description => "The directory in which the plugins will be installed",
  :type => "string"

attribute "percona-install/plugins_nagios", 
  :dislpay_name => "Percona Install - Plugins Nagios Path",
  :description => "The directory in which the nagios plugins will be installed",
  :type => "string"

