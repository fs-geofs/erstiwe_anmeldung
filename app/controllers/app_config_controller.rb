class AppConfigController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end

  def edit
    if !AppConfig.any?
      AppConfig.create(beginning: Time.now, ending: Time.now + 3.days, mail_adress: "change me", mail_server:"change me", mail_user:"change me", mail_password: "change me", mail_port: 25, mail_auth: false)
    end
    @config = AppConfig.first
  end

  def update
    @config = AppConfig.first
    app_config_params = config_params
    if app_config_params[:mail_password].empty?
      app_config_params.delete(:mail_password)
    end

    if @config.update_attributes(app_config_params)
      flash[:success] = "Konfiguration gespeichert"
      redirect_to app_config_path
    else
      @config.update_attributes(app_config_params)
      render 'edit'
    end
  end


  private
  def config_params
    params.require(:app_config).permit(:beginning, :ending, :mail_adress, :mail_server, :mail_user, :mail_password, :mail_port, :mail_auth)
  end
end
