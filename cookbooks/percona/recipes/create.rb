include_recipe "percona::server"

username = node.percona.username
password = node.percona.password
host = node.percona.hostname
db = node.percona.database

execute "create #{username} database user" do
  command %Q( mysql --execute="create user '#{username}'@'#{host}'
          identified by '#{password}';
          grant all on #{db}.* to '#{username}'@'%';
          flush privileges" )
  not_if "mysql --silent --skip-column-names --database=mysql \
        --execute=\"select User from user where \
        User = '#{username}'\" | grep #{username}"
end

execute "create #{db} database" do
  command "mysql --execute=\"create database #{db} character set utf8\""
  not_if "mysql --silent --skip-column-names \
      --execute=\"show databases like '#{db}'\" | grep #{db}"
  user "root"
end
