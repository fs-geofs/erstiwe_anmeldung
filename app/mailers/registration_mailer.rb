class RegistrationMailer < Devise::Mailer
  helper RegistrationMailerHelper
  helper :application

  def confirmation_instructions(record, token, opts={})
    @token = token
    @config = AppConfig.first
    opts = opts.merge({delivery_method: :smtp,
     delivery_method_options: {
       address: @config.mail_server,
       port: @config.mail_port,
       user_name: @config.mail_user,
       password: @config.mail_password,
       enable_starttls_auto: true}})
    binding.pry
    devise_mail(record, :confirmation_instructions, opts)
  end

  def registration_complete_mail(registration)
    @registration = registration
    @config = AppConfig.first
    @begin = @config.beginning
    @end = @config.ending
    mail(to: @registration.email,
     from:  @config.mail_adress,
     delivery_method: :smtp,
     delivery_method_options: {
       address: @config.mail_server,
       port: @config.mail_port,
       user_name: @config.mail_user,
       password: @config.mail_password,
       enable_starttls_auto: true},
     subject: "Anmeldung Erstiwochenende #{@begin.year} - Daten vervollständigt",
     content_type: "text/plain").deliver
  end

end
