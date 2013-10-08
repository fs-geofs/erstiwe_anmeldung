class TicketsController < ApplicationController

  def print
    @tickets = Ticket.all
  end

  def confirm_generate
  end

  def generate
    Ticket.destroy_all #delete all current tickets
    70.times do #generate 70 tickets
      Ticket.create
    end
    redirect_to '/tickets/print'
  end

  private

    def ticket_redeem_params
      params.require(:ticket).permit(:email, :token)
    end 
end
