class TicketsController < ApplicationController

  def index
  end

  def redeem
    @ticket = Ticket.find_by ticket: ticket_redeem_params[:ticket]
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

  def new
  end

  def create
    chars = ('A'..'Z').to_a
    tickets = []
    Ticket.transaction do
      Ticket.destroy_all #delete all current tickets
      70.times do #generate 70 tickets
        ticket = new_ticket(chars)
        while(tickets.include?(ticket)) #if ticket exists, generate a new one
          ticket = new_ticket(chars)
        end
        Ticket.new(ticket: ticket).save
      end
    end
    @tickets = Ticket.all
    render 'print'
  end

  private

    def new_ticket(input)
      (0...16).map{ input[rand(input.length)] }.join
    end

    def ticket_redeem_params
      params.permit(:email, :ticket)
    end 
end
