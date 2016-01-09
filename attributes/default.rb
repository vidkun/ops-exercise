default['wordpress']['url'] = 'http://wordpress.org/latest.tar.gz'
default['wordpress']['server_port'] = 80
default['wordpress']['db']['instance_name'] = 'wordpress'
# Use Chef-Vault for user creds in production
default['wordpress']['db']['root_password'] = 'SuperSecretSquirrel'
default['wordpress']['db']['name'] = 'wpdb'
default['wordpress']['db']['user'] = 'wpuser'
default['wordpress']['db']['pass'] = 'wppass'
default['wordpress']['db']['prefix'] = 'wpblog_'
default['wordpress']['dir'] = '/var/www/wordpress'
default['wordpress']['install']['user'] = 'www-data'
default['wordpress']['install']['group'] = 'www-data'

default['nginx']['default_site_enabled'] = false
