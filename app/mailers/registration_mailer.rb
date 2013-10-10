class RegistrationMailer < ActionMailer::Base
  default from: "fsgi@uni-muenster.de"
  helper RegistrationMailerHelper

  def registration_complete_mail(registration)
    @registration = registration
    @begin = Time.new(2013,11,1,9,30,0)
    @end = Time.new(2013,11,3,13,0,0)
    mail(to: @registration.email,
     subject: "Anmeldung Erstiwochenende #{@begin.year} - Daten vervollständigt",
     content_type: "text/plain").deliver
  end

end
