class ApplicationController < ActionController::Base
  before_action :require_login

  NotAuthorized = Class.new(StandardError)

  def require_login
    return if session[:auth]

    redirect_to new_session_path
  end

  rescue_from ApplicationController::NotAuthorized do |_|
    respond_to do |format|
      format.any  { head :forbidden }
    end
  end
end
