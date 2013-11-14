class WaitingsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :edit_email_password, :update, :destroy, :list]


  private
    def admin!
      redirect_to new_user_session_path unless current_user && current_user.admin?
    end

    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end

    def regenerate_token_for user
      t = user.ticket
      t.generate_token
      t.save
    end

    def needs_password?(user, params)
       params[:password].present? or (params[:email].present? and !current_user.admin?)
    end

end