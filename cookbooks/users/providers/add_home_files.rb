#!/usr/bin/ruby
action :install do
    search("#{new_resource.data_bag}", "groups:#{new_resource.search_group} NOT action:remove") do |u|
        # Set home to location in data bag,
        # or a reasonable default (/home/$user).
        if u['home']
          home_dir = u['home']
        else
          home_dir = "/home/#{u['id']}"
        end

        template "#{home_dir}/.screenrc" do
          source "screenrc.erb"
          cookbook new_resource.cookbook
          owner u['id']
          group u['gid'] || u['id']
          mode "0600"
          action :create_if_missing
        end

        template "#{home_dir}/.vimrc" do
          source "vimrc.erb"
          cookbook new_resource.cookbook
          owner u['id']
          group u['gid'] || u['id']
          mode "0600"
          action :create_if_missing
        end

        template "#{home_dir}/.gitconfig" do
          source "gitconfig.erb"
          cookbook new_resource.cookbook
          owner u['id']
          group u['gid'] || u['id']
          mode "0600"
          variables :user_name => u['name'],
                    :user_email => u['email']
          action :create_if_missing
        end

        template "#{home_dir}/.bash_profile" do
          source "bash_profile.erb"
          cookbook new_resource.cookbook
          owner u['id']
          group u['gid'] || u['id']
          mode "0600"
          action :create_if_missing
        end
    end
end
