class Registration < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :ticket, :study, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }
  after_save :registration_complete_message

  def registration_complete_message
    RegistrationMailer.registration_complete_mail(self)
  end 
end
