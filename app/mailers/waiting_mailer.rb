class WaitingMailer < Devise::Mailer
  helper :application

  def mass_mail
    @addresses = Waiting.all.map { |w| w.email }.compact
    @config = AppConfig.first
    @tickets = Ticket.free.limit(User.withdrawn.count - User.from_waiting_list.count)
    mail(mail_config({to: @config.mail_adress,
     bcc: @addresses,
     subject: "Wartelistenplatz Erstiwochenende",
     content_type: "text/plain"})).deliver
  end

  private

    def mail_config args
      @config = AppConfig.first
      {from: @config.mail_adress,
       delivery_method: :smtp,
       delivery_method_options: {
         address: @config.mail_server,
         port: @config.mail_port,
         user_name: @config.mail_user,
         password: @config.mail_password,
         enable_starttls_auto: true}}.merge(args)
    end

end
