class Waiting < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :confirmable

  before_validation :deny_entry_if_waiting_list_closed

  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: email_regexp }


  def send_on_create_confirmation_instructions
    unless @raw_confirmation_token
      generate_confirmation_token!
    end

    send_devise_notification(:waiting_list_confirmation_instructions, @raw_confirmation_token, {})
  end

  def deny_entry_if_waiting_list_closed
    AppConfig.first.waiting_list_open
  end    

end
