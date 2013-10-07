class LandingPageController < ApplicationController

  def index
    @ticket = Ticket.new
  end

end
