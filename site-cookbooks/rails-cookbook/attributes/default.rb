default["app"]["appname"] = ""
default["app"]["hostname"] = "localhost"
default["users"]["deploy_keys"] = []
default["users"]["apps_dir"] = "/home/apps"

default["users"]["deploy_user"] = "deploy"
default["users"]["apps_user"] = "apps"

default["postgresql"]["db_root_password"] = nil

# A list of database_user's attribute parameters.
# See database cookbook for details.
default["databases"]["postgresql"] = []

default["ruby"]["version"] = "2.0.0-p247"

default["rails-cookbook"]["default_config"]["nginx"]["template_name"] = "nginx_vhost.conf.erb"
