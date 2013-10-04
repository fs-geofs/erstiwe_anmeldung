class Ticket < ActiveRecord::Base
  validates :ticket, length: {is: 16}, presence: true, uniqueness: { case_sensitive: false }
end
