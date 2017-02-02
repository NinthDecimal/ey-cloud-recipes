#
# Cookbook Name:: paperclip
# Recipe:: default
#
# symlink public/tenants logos

after 'deploy:update_code', 'symlink_logos'

task :symlink_logos do
  folder = 'tenants'

  path         = "#{config.release_path}/../../shared/#{folder}"
  symlink_path = "#{config.release_path}/public"

  run "mkdir -p #{path}"
  puts "Symlinking #{symlink_path}/#{folder} folder with tenant logos"
  run "rm -rf #{symlink_path}"
  run "ln -sf #{path} #{symlink_path}"
end
