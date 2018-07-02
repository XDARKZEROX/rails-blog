# Clase principal
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Is true return boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = 'debes estar logueado'
      redirect_to root_path
    end
  end


  
end
