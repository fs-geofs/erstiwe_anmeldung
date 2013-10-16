class AppConfig < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :beginning, :ending
  validates :beginning, :ending, :mail_adress, :mail_server, :mail_user, :mail_port, presence: true
end
