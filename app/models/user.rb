class User < ActiveRecord::Base
  attr_accessor :pre_token
  belongs_to :ticket
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :map_ticket

  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :ticket_id, :study, presence: true, if: :confirmed?, unless: :admin
  validates :ticket_id, presence: true, uniqueness: true, unless: :admin


  def map_ticket
    binding.pry
    if self.admin == false
      self.ticket ||= Ticket.find_by(token: self.pre_token.upcase)
    end
  end

  def details_present?
    self.fname.present? and self.lname.present? and self.streetno.present? and self.street.present? and self.zip.present? and self.place.present? and self.birthday.present? and self.ticket_id.present? and self.study.present?
  end
end   
