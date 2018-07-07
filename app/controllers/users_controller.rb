class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(params[:user][:username])

    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      @user = User.new(user_params)

      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user.errors
        redirect_to signup_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
    if logged_in? && current_user == @user
      render :show
    else
      flash[:message] = "Access Denied: You must be logged in to the correct user to view that page."
      redirect_to logout_path
    end
  end

  def edit
  end

  def update
  end

  def destroy

    session.delete :user_id
    redirect_to '/'

  end

private

  def user_params
    params.require(:user).permit(:bank_id, :first_name, :last_name, :street_address, :city, :state, :zip_code, :age, :username, :email, :password)
  end

end
