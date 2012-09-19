include_recipe "percona::default"

package "percona-server-server"

def generate_id
  Chef::Log.info "Percona server-id: #{node.percona.server_id}"
  begin
    item = data_bag_item( "percona", "server-id" )
    id = item['last-used'] + 1
  rescue Net::HTTPServerException => e
    id = 1
    raise e unless e.response.code == "404"
  end

  item = Chef::DataBagItem.new
  item.data_bag "percona"
  item.raw_data = { "id" => "server-id", "last-used" => id }
  item.save

  node.set.percona.server_id = id
  node.save
end

generate_id if node.percona.server_id == 0

service "mysql" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
