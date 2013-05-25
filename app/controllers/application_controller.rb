class ApplicationController < ActionController::Base
  protect_from_forgery

  # give template access to helper methods
  helper_method :current_user, :logged_in?

  # current_user helper method

  def current_user
    # if session[user_id] has a value, return that user record.
    @current_user||=User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Returns True or False whether current_user is true or false
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end


end
