class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    return unless params[:admin_key] == Rails.application.credentials.config[:admin_key]

    session[:auth] = true
    session[:admin] = true
    redirect_to registrations_path
  end

  def create
    respond_to do |format|
      if params.require(:login)[:start_time_date].to_date == Rails.application.credentials.config[:start_date]
        session[:auth] = true
        format.html { redirect_to root_path }
      else
        flash[:danger] = t('messages.login.fail')
        format.html { redirect_to action: 'new', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    reset_session

    redirect_to action: 'new'
  end
end
