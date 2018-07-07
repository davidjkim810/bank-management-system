class SessionsController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.find_by(:username => params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    elsif !@user
      flash[:message] = "Username not found"
      redirect_to login_path
    elsif !@user.authenticate(params[:user][:password])
      flash[:message] = "Password Invalid"
      redirect_to login_path
    end
  end
end
