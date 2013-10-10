class RegistrationMailer < Devise::Mailer
  helper RegistrationMailerHelper
  helper :application

  def confirmation_instructions(record, token, opts={})
    @token = token
    @config = AppConfig.first
    opts = mail_config opts
    devise_mail(record, :confirmation_instructions, opts)
  end

  def registration_complete_mail(registration)
    @registration = registration
    @config = AppConfig.first
    @begin = @config.beginning
    @end = @config.ending
    mail(mail_config({to: @registration.email,
     subject: "Anmeldung Erstiwochenende #{@begin.year} - Daten vervollständigt",
     content_type: "text/plain"})).deliver
  end

  def registration_destroyed_mail(user)
    @user = user
    @config = AppConfig.first
    mail(mail_config({to: @config.mail_adress,
     subject: "Anmeldung Erstiwochenende gelöscht - neues Ticket",
     content_type: "text/plain"})).deliver
  end

  private

    def mail_config args
      @config = AppConfig.first
      {from:  @config.mail_adress,
       delivery_method: :smtp,
       delivery_method_options: {
         address: @config.mail_server,
         port: @config.mail_port,
         user_name: @config.mail_user,
         password: @config.mail_password,
         enable_starttls_auto: true}}.merge(args)
    end

end
