Erstiwochenende Anmeldung
=========================

Rails app for the students representatives geoinformatics Münster to allow students to sign up for the freshmen weekend.

Rails app der Fachschaft Geoinformatik Münster für die Anmeldung für das Erstiwochenende.

Create an admin user
--------------------

Do this after you created and migrated your database.

  * open the rails console
  * Type `User.new(password: 'hallo').encrypted_password` with your desired password for the admin user
  * Copy the resulting string (the one in the quotes)
  * leave the rails console
  * `sudo su postgres`
  * `psql erstiwe_anmeldung_production -c "INSERT INTO users (email, encrypted_password, confirmed_at, admin) VALUES ('YOUR-DESIRED-EMAIL@PROVIDER.COM', 'HASH FROM SECOND STEP', now(), true);"`
  * To verify that your user has been created you could use `psql erstiwe_anmeldung_production` and `SELECT * FROM users;`. Leave psql with `\q` or Ctrl-D
