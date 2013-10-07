class Ticket < ActiveRecord::Base
  before_create :generate_token

  def generate_token
    chars = ('A'..'Z').to_a
    self.token = (0...16).map{ chars[rand(chars.length)] }.join
  end
end
