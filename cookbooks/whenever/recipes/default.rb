#
# Cookbook Name:: whenever
# Recipe:: default
#

# for the until instance named 'util'
if node[:instance_role] == 'app_master'
  ey_cloud_report "whenever" do
    message "Starting whenever recipe"
  end

  app_names = node[:applications].keys
  local_user = node[:users].first

  app_names.each do |app_name|
    execute "setting whenever for #{app_name}" do
      cwd "/data/#{app_name}/current"
      user local_user[:username]
      command "bundle exec whenever --update-crontab '#{app_name}_#{node[:environment][:framework_env]}'"
      action :run
      only_if { ::File.exists?("/data/#{app_name}/current/ey_bundler_binstubs/whenever")}
    end
  end

  ey_cloud_report "whenever" do
    message "Whenever recipe complete"
  end
end