class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])

    # alternative syntax:
    # user = User.where(username: params[:username]).first

    # If user exists & user's password matches password_digest for that user..
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Something wrong with your user/pass."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end


end