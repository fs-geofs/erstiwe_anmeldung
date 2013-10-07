class TicketsController < ApplicationController

  def index
    @ticket = Ticket.new
  end

  def redeem
    @ticket = Ticket.find_by! token: ticket_redeem_params[:token]
    if @ticket.email != nil
      flash[:alert] = 'Ticket schon eingelöst'
      render 'index'
      return
    end

    @ticket.email = ticket_redeem_params[:email]
    if @ticket.save
      flash[:notice] = 'alles gut!'
      render 'index'
    else
      flash[:alert] = 'Fehler'
      render 'index'
    end
  end

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
