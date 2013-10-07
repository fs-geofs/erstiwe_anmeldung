class User < ActiveRecord::Base
  has_one :ticket
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :token, :study, presence: true, if: :confirmed?
  validate :ticket_exits

  after_update :registration_complete_message

  def registration_complete_message
    binding.pry
    RegistrationMailer.registration_complete_mail(self) if details_present?
  end

  def ticket_exits
    Ticket.find_by! token: token
  end

  def details_present?
    self.fname.present? and self.lname.present? and self.streetno.present? and self.street.present? and self.zip.present? and self.place.present? and self.birthday.present? and self.token.present? and self.study.present?
  end
end   
