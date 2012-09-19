include_recipe "percona::slave"

execute "create replication database user" do
  command %Q( mysql --execute="create user 'repl'@'127.0.0.1';
          grant replication slave, replication client on *.* to 'repl'@'127.0.0.1';
          flush privileges" )
  not_if "mysql --silent --skip-column-names --database=mysql \
        --execute=\"select User from user where \
        User = 'repl'\" | grep repl"
end
