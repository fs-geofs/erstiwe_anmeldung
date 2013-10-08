class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_filter :admin!, :only => :list


  def list
    @users = User.all
  end

  def admin!
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

end