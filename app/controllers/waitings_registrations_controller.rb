class WaitingsRegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  # prepend_before_filter :authenticate_scope!, :only => [:edit, :edit_email_password, :update, :destroy, :list]
  before_filter :admin!, :only => [:list, :destroy]

  def mass_add
    params[:addresses].lines.each do |address|
      Waiting.create(email: address)
    end
    redirect_to waiting_list_list_path
  end

  def list
  end

  def mail
    WaitingMailer.mass_mail
    redirect_to waiting_list_list_path
  end

  # DELETE /resource
  def destroy
    @waiting = Waiting.find(params[:id])
    @waiting.destroy
    redirect_to waiting_list_list_path
  end

  private
    def admin!
      redirect_to new_user_session_path unless current_user && current_user.admin?
    end

end
