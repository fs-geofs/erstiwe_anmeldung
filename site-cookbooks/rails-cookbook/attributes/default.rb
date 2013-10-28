default["app"]["appname"] = ""
default["app"]["hostname"] = "localhost"
require 'securerandom'
default["app"]["secret_token"] = SecureRandom.hex(64)
default["users"]["deploy_keys"] = []
default["users"]["apps_dir"] = "/home/apps"

default["users"]["deploy_user"] = "deploy"
default["users"]["apps_user"] = "apps"

default["postgresql"]["db_root_password"] = nil

# A list of database_user's attribute parameters.
# See database cookbook for details.
default["postgresql"]["database"] = nil
default["postgresql"]["config"]["ssl"] = false

default["ruby"]["version"] = "2.0.0-p247"

default["rails-cookbook"]["default_config"]["nginx"]["template_name"] = "nginx_vhost.conf.erb"


default['nginx']['source']['modules'] = %w[
                                          nginx::http_ssl_module
                                          nginx::http_gzip_static_module
                                          nginx::passenger
                                          ]