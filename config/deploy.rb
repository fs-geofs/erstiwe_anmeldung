set :application, 'erstiwe_anmeldung'
set :repo_url, 'git@github.com:ubergesundheit/erstiwe_anmeldung.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/apps/erstiwe_anmeldung'
#set :default_shell, '/bin/bash --login'

set :bundle_flags, "--deployment"
set :bundle_without, "test development deploy"

set :rbenv_type, :system # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.0.0-p247'
set :rbenv_custom_path, '/opt/rbenv'

# set :rails_env, :production

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/home/deploy/.rbenv/shims:$PATH" }
# set :keep_releases, 5

namespace :deploy do


  task :start do
    sudo "sv up app1"
  end
  task :stop do
    sudo "sv down app1"
  end
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :groups, max: 3, wait: 5 do
      sudo :sv, 'restart erstiwe_anmeldung'
    end
  end

  after :finishing, 'deploy:cleanup'

end