#
# Cookbook Name:: rails-cookbook
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Update apt-get packages
include_recipe 'apt'

# create users
include_recipe 'rails-cookbook::users'
# create directories for users
include_recipe 'rails-cookbook::apps_dir'

# create database.yml for symlinking to rails app
template(File.join(node["users"]["apps_dir"], )) do
  source 'database.yml.erb'
  owner 'apps'
  group 'apps'
  variables(
    database: node["postgresql"]["databases"][0]["database_name"],
    user: node["postgresql"]["databases"][0]["username"],
    password: node["postgresql"]["databases"][0]["password"]
  )
end

# install git and curl
include_recipe 'curl'
include_recipe 'git'

include_recipe 'rails-cookbook::postgresql'
include_recipe 'rails-cookbook::pg_user'

include_recipe 'rails-cookbook::ruby'

# set passenger and ruby paths for the nginx::passenger recipe
node.default["nginx"]["passenger"]["ruby"] = node[:rbenv][:root] + "/shims/ruby"
node.default["nginx"]["passenger"]["root"] = node[:rbenv][:root] + "/versions/" + node[:ruby][:version] + "/lib/ruby/gems/2.0.0/gems/passenger-"  + node[:nginx][:passenger][:version]
include_recipe 'nginx::source'

# disable default vhost and create new vhost
include_recipe 'rails-cookbook::vhost'

include_recipe 'nodejs'