class Ticket < ActiveRecord::Base
  has_one :user, dependent:  :destroy
  before_create :generate_token

  def generate_token
    chars = ('A'..'Z').to_a
    self.token = (0...6).map{ chars[rand(chars.length)] }.join
  end
end
