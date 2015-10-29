class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #convert number to boolean... like a BOSS
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end

  def authenticate_denis
    unless logged_in? && current_user.name == 'denis'
      flash[:error] = "You are not denis, sorry!"
      redirect_to root_path
    end
  end
end

