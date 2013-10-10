class AppConfig < ActiveRecord::Base
  validates :beginning, :ending, :mail_adress, :mail_server, :mail_user, :mail_password, :mail_port, presence: true
end
