class SessionsController < ApplicationController

  def index

    if logged_in?
      redirect_to user_path(current_user)
    else

    end
  end

  def new
    @user = User.new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    if auth_hash = auth
      oauth_email = auth["info"]["email"]
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        bank = Bank.all.first
        user = User.create(:email => oauth_email, :password => "abc123", :bank_id => bank.id)
    
        session[:user_id] = user.id
        redirect_to user_path(user)
      end
    else

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

  private

  def auth
    request.env['omniauth.auth']
  end

end
