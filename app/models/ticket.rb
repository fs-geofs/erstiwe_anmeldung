class Ticket < ActiveRecord::Base
  validates :ticket, length: {is: 16}, presence: true, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }, on: 'update'
  after_update :redeem_complete_message

  def redeem_complete_message
    RegistrationMailer.redeem_complete_mail(self)
  end 
end
