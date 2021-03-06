class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def print
    @tickets = Ticket.all
  end

  def generate
    Ticket.destroy_all #delete all current tickets
    70.times do #generate 70 tickets
      Ticket.create
    end
    flash[:notice] = 'Neue Tickets generiert'
    redirect_to '/tickets/print'
  end

  private

    def ticket_redeem_params
      params.require(:ticket).permit(:email, :token)
    end

end
