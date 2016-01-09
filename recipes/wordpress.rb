#
# Cookbook Name:: ops-exercise
# Recipe:: wordpress
#

# install nginx and wordpress
include_recipe 'wordpress::nginx'

# install hhvm
include_recipe 'hhvm'

# run hhvm setup script to include in nginx config
execute 'install-hhvm-nginx' do
  command '/usr/share/hhvm/install_fastcgi.sh'
  user 'root'
  action :run
  not_if 'grep -q "include hhvm.conf;" /etc/nginx/sites-available/default'
end

# update site config for wordpress to use hhvm instead of php-fpm
ruby_block 'update-wordpress-use-hhvm' do
  block do
    file = Chef::Util::FileEdit.new('/etc/nginx/sites-enabled/wordpress.conf')
    file.search_file_replace_line('^\s*fastcgi_pass 127.0.0.1:9001;$', '        fastcgi_pass 127.0.0.1:9000;')
    file.write_file
  end
  
  not_if 'grep -q "fastcgi_pass 127.0.0.1:9000;" /etc/nginx/sites-enabled/wordpress.conf'
  notifies :restart, 'service[nginx]', :delayed
end
