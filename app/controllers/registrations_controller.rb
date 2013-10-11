class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  before_filter :admin!, :only => :list

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
    update_params = account_update_params
    update_params.delete(:current_password)
    if resource.update_without_password(update_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
      # send registration complete mail
      if resource.details_present?
        RegistrationMailer.registration_complete_mail(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def list
    @users = User.all
  end

  # DELETE /resource
  def destroy
    if current_user.admin?
      @user = User.find(params[:user])
      regenerate_token_for @user
      RegistrationMailer.registration_destroyed_mail @user
      @user.destroy
      redirect_to users_list_path
    else
      regenerate_token_for resource
      RegistrationMailer.registration_destroyed_mail @user
      resource.destroy
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message :notice, :destroyed if is_navigational_format?
      respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
    end
  end

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

end