include_recipe "database::postgresql"
#TODO Chef 11 compat?
node.set['postgresql']['pg_hba'] = [
  {:type => 'local', :db => 'all', :user => 'postgres', :addr => nil, :method => 'ident'},
  {:type => 'local', :db => 'all', :user => 'all', :addr => nil, :method => 'md5'},
  {:type => 'host', :db => 'all', :user => 'all', :addr => '127.0.0.1/32', :method => 'md5'},
  {:type => 'host', :db => 'all', :user => 'all', :addr => '::1/128', :method => 'md5'}
]


postgresql_connection_info = {
  :host => "localhost",
  :port => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

node["postgresql"]["databases"].each do |entry|

  postgresql_database entry["database_name"] do
    connection postgresql_connection_info
    template entry["template"] if entry["template"]
    encoding entry["encoding"] if entry["encoding"]
    collation entry["collation"] if entry["collation"]
    connection_limit entry["connection_limit"] if entry["connection_limit"]
    owner entry["owner"] if entry["owner"]
    action :create
  end

  postgresql_database_user entry["username"] do
    connection postgresql_connection_info
    action [:create, :grant]
    password(entry["password"]) if entry["password"]
    database_name(entry["database_name"]) if entry["database_name"]
    privileges(entry["privileges"]) if entry["privileges"]
  end

end

# execute "create-database-user" do
#   code = <<-EOH
#   sudo su postgres -c \"psql -c "select * from pg_user where username='#{node[:databases][:postgresql][:username]}'" | grep -c #{node[:databases][:postgresql][:username]}\"
#   EOH
#   command "sudo su postgres -c 'createuser -sw #{node[:databases][:postgresql][:username]}'"
#   not_if code
# end
