class AccountsController < ApplicationController
  def new
    @account = Account.new
    @user = User.find(params[:user_id])
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @account = Account.find(params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:type_of_account, :balance, :user_id)
  end
end
