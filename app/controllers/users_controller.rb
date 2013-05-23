class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Welcome #{@user.username}! You are now registered."
      redirect_to posts_path
    else
      # TODO - display errors on the New form page
      render :new   #renders users#new template corresponding to action. Same as render "new" and render action: "edit", to be explicit
    end
  end

end

