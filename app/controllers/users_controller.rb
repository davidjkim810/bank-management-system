class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
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
    params.require(:user).permit(:bank_id, :first_name, :last_name, :street_address, :city, :state, :zip_code, :age, :username, :email, :password_digest)
  end
  
end
