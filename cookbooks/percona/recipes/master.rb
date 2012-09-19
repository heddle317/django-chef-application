include_recipe "percona::server"

template "/etc/mysql/my.cnf" do
  source "master.cnf.erb"
  variables :server_id => node.percona.server_id
  # notifies :restart, resources( :service => "mysql" )
end
