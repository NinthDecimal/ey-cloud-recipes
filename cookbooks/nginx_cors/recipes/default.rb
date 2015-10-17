#nginx_cors/recipes/default.rb
#create new directory in cookbooks/ in your ey-cloud-recipes repository
#upload recipie, apply and restart nginx on all servers

#
# Cookbook Name:: nginx_cors
# Recipe:: default
#

if ['app_master', 'app', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app, data|

    template "/etc/nginx/servers/#{app}/custom.ssl.conf" do
      source 'custom.conf.erb'
      owner node[:users][0][:username]
      group node[:users][0][:username]
      mode 0644
    end

    execute "sudo /etc/init.d/nginx reload"

    ey_cloud_report "nginx_cors" do
      message "CORS settings updated for nginx"
    end

  end
end