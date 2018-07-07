class UsersController < ApplicationController
  def new

    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user && @user.authenticate(params[:user][:password])
      @user.save
      
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:bank_id, :first_name, :last_name, :street_address, :city, :state, :zip_code, :age, :username, :email, :password)
  end

end
