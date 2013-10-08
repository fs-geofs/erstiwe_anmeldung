class User < ActiveRecord::Base
  attr_accessor :pre_token
  belongs_to :ticket
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :map_ticket

  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :ticket_id, :study, presence: true, if: :confirmed?
  validates :ticket_id, presence: true, uniqueness: true


  after_update :registration_complete_message, if: :details_present?


  def map_ticket
    self.ticket = Ticket.find_by(token: self.pre_token)
  end

  def registration_complete_message
    RegistrationMailer.registration_complete_mail(self)
  end

  def details_present?
    self.fname.present? and self.lname.present? and self.streetno.present? and self.street.present? and self.zip.present? and self.place.present? and self.birthday.present? and self.ticket_id.present? and self.study.present?
  end

end   
