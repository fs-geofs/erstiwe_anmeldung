class RegistrationsController < ApplicationController

  def show
    @user = Registration.find(params[:id])
  end

  def new
  	@registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to @user
    else
      render 'new'
    end
  end


  private

  	def registration_params
      params.require(:registration).permit(:fname, :lname, :email, :gender, 
      	:street, :streetno, :zip, :place, :birthday, :study, :vegetarian, :vegan, :ticket, :phone, :comment)
    end  	
end
