# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if !AppConfig.any?
  AppConfig.create(beginning: Time.now, ending: Time.now + 3.days, mail_adress: "change me", mail_server:"change me", mail_user:"change me", mail_password: "change me", mail_port: 25, mail_auth: false, registration_complete_mail: File.open("#{Rails.root}/app/views/registration_mailer/registration_complete_mail.text.erb","r").read)
end

User.create(email: 'fsgi@wwu.de', password: 'changeme', admin: true, confirmed_at: Time.now)
