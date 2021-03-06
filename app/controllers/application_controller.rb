class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def require_login!
    unless current_user
      redirect_to login_path, :notice => 'if you want to add a notice'
    end
    
  end
end
