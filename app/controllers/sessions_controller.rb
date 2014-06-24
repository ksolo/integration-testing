class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render text: "Welcome Back"
    else
      flash["notice"] = "Invalid Credentials"
      render :new
    end
  end

end