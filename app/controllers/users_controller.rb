class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if logged_in? && current_user == @user
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
    if logged_in? && current_user == @user
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages
      render :edit
    end
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
