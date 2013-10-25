# Cookbook Name:: rails-cookbook
# Recipe:: users
#
# Setup default users, groups and sudoers for
# apps deployment purpose.
#

include_recipe "user"

user_account node["users"]["apps_user"] do
  comment "apps runner"
end
user_account node["users"]["deploy_user"] do
  comment "deployer"
  ssh_keys node["users"]["deploy_keys"]
end

group node["users"]["apps_user"] do
  action :modify
  members [
    node["users"]["apps_user"],
    node["users"]["deploy_user"]
  ]
end

node.default["authorization"]["sudo"]["groups"] = [
  "sudo",
  node["users"]["deploy_user"]  # TODO workaround to enable deployer to restart app
]
node.default["authorization"]["sudo"]["passwordless"] = true

include_recipe "sudo"
