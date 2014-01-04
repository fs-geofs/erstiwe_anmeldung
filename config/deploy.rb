set :application, 'erstiwe_anmeldung'
set :repo_url, 'git@github.com:fs-geofs/erstiwe_anmeldung.git'

set :branch, 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/apps/erstiwe_anmeldung'
#set :default_shell, '/bin/bash --login'

set :bundle_flags, "--deployment"
set :bundle_without, "test development deploy"

set :rbenv_type, :system  
set :rbenv_ruby, '2.0.0-p353'
set :rbenv_custom_path, '/opt/rbenv'

# set :format, :pretty
# set :log_level, :debug

set :linked_files, %w{config/database.yml config/initializers/secret_token.rb config/application.rb}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :keep_releases, 5

namespace :deploy do

  task :restart do
    on roles(:app), in: :groups, max: 3, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :migrate, :seed

  after :finished, :chown_apps_dir_to_apps
  after :chown_apps_dir_to_apps, 'deploy:restart'

  before :starting, :chown_apps_dir_to_deploy

  after :finishing, 'deploy:cleanup'


end
