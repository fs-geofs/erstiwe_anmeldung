class User < ActiveRecord::Base
  attr_accessor :pre_token
  belongs_to :ticket
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :map_ticket
  before_create :is_from_waiting_list?

  validates :fname, :lname, :street, :streetno, :zip, :place, :birthday, :ticket_id, :study, presence: true, if: :confirmed?, unless: :admin
  validates :ticket_id, presence: true, uniqueness: true, unless: :admin_or_withdrawn?

  scope :withdrawn, -> { where(withdrawn: true) }
  scope :from_waiting_list, -> { where(from_waiting_list: true) }

  def map_ticket
    if self.admin == false
      self.ticket ||= Ticket.find_by(token: self.pre_token.upcase)
    end
  end

  def details_present?
    self.fname.present? and self.lname.present? and self.streetno.present? and self.street.present? and self.zip.present? and self.place.present? and self.birthday.present? and self.ticket_id.present? and self.study.present?
  end

  def is_from_waiting_list?
    if Waiting.count > 0 and (User.withdrawn.count - User.from_waiting_list.count) > 0
      if Waiting.where(email: self.email)
        self.from_waiting_list = true
        Waiting.where(email: self.email).first.destroy
      end
    end
  end

  def active_for_authentication?
    super && !withdrawn
  end

  def admin_or_withdrawn?
    self.admin? or self.withdrawn?
  end

end
