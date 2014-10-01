remote_file "/tmp/wkhtmltopdf.tar.bz2" do
  source "http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.10.0_rc2-static-amd64.tar.bz2"
  action :create_if_missing
end

execute "Untar wkhtmltopdf" do
  cwd "/tmp"
  command "sudo tar -jxvf wkhtmltopdf.tar.bz2"
  action :run
end

execute "Copy wkhtmltopdf" do
  cwd "/tmp"
  command "sudo mv wkhtmltopdf-amd64 /usr/local/bin/wkhtmltopdf && chown root:root /usr/local/bin/wkhtmltopdf"
  action :run
end 
