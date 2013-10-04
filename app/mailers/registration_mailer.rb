class RegistrationMailer < ActionMailer::Base
  default from: "fsgi@uni-muenster.de"

  def registration_complete_mail(registration)
    @registration = registration
    mail(to: @registration.email,
     subject: 'Anmeldung Erstiwochenende todo - Daten vervollständigt',
     content_type: "text/plain").deliver
  end

end
