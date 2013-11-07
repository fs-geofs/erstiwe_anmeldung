Erstiwochenende Anmeldung
=========================

Rails app for the students representatives geoinformatics Münster to allow students to sign up for the freshmen weekend.

Rails app der Fachschaft Geoinformatik Münster für die Anmeldung für das Erstiwochenende.


# Deployment/Installation on Server

  1.  Prepare your deployment environment
    * Generate a ssh-key and copy it to your server
    * Clone this repository and checkout the `deploy` branch
    * Install the latest ruby 2
    * run `gem install bundle` (you probably need to use sudo)
    * cd into the repo and run `bundle install --without development production`

  2. Provision the server and deploy the app
    * cd into the repo and run `bundle exec berks install --path cookbooks/`
    * run `bundle exec knife solo prepare user@host` to prepare your server
    * modify the file `nodes/<yourhost>.json. there is an example JSON file in the same folder
    * run `bundle exec knife solo cook user@host` to install all dependencies on the server
    * Go drink some coffee, this takes some time
    * change the hostname in the `config/deploy/production.rb` file to your server
    * if you changed the default deploy paths in the `nodes/<yourhost>.json`, then change them also in `config/deploy.rb`
    * run `bundle exec cap production deploy` to deploy the app

  3. Create an admin user
    * ssh into your production server
    * switch to the apps user `sudo su apps -l`
    * cd into your applications root, eg `cd erstiwe_anmeldung/current`
    * open the rails console with prouction environment `bundle exec rails c -e production`
    * Create a new admin user with `User.create(email: 'YOUR-DESIRED-EMAIL@PROVIDER.COM', password: 'min6chars', admin: true, confirmed_at: Time.now)`
    * Leave the console typing `exit`

  4. Configure the app
    * go to `http://<your_hostname>/app_config` log in with your admin user and change the settings
