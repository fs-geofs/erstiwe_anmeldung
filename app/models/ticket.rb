class Ticket < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }, on: 'update'

  before_create :generate_token
  after_update :redeem_complete_message

  def redeem_complete_message
    RegistrationMailer.redeem_complete_mail(self)
  end

  def generate_token
    chars = ('A'..'Z').to_a
    self.token = (0...16).map{ chars[rand(chars.length)] }.join
  end
end
