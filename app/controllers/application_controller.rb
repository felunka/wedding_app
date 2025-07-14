class ApplicationController < ActionController::Base
  before_action :set_active_storage_url_options
  before_action :require_login

  NotAuthorized = Class.new(StandardError)

  def require_login
    return if session[:auth]

    redirect_to new_session_path
  end

  private

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
  end

  rescue_from ApplicationController::NotAuthorized do |_|
    respond_to do |format|
      format.any  { head :forbidden }
    end
  end
end
