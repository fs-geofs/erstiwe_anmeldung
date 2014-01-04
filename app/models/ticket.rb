class Ticket < ActiveRecord::Base
  has_one :user, dependent:  :destroy
  before_create :generate_token

  scope :free, -> { where( 'id not in (?)', User.all.map { |u| u.ticket_id }.compact ) }
  scope :taken, -> { where( 'id in (?)', User.all.map { |u| u.ticket_id }.compact ) }

  def generate_token
    chars = ('A'..'Z').to_a
    self.token = (0...6).map{ chars[rand(chars.length)] }.join
  end

  def taken?
    User.where(ticket: self).exists?
  end

end
