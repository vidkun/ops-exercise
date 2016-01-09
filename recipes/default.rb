#
# Cookbook Name:: ops-exercise
# Recipe:: default
#
include_recipe 'apt'
include_recipe 'ops-exercise::database'
include_recipe 'ops-exercise::wordpress'
include_recipe 'os-hardening'
include_recipe 'ssh-hardening'
