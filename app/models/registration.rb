class Registration < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :ticket, :study, :vegetarian, :vegan, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }
end
