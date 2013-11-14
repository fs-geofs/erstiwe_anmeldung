class WaitingsController < Devise::ConfirmationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :edit_email_password, :update, :destroy, :list, :cancel]

  protected

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      root_path
    end
end