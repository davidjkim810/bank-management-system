class AccountsController < ApplicationController
  def new
    @account = Account.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @account = @user.accounts.build(account_params)
    if @account.save
      redirect_to user_path(@user)
    else
      flash[:message] = @account.errors.full_messages_for(:balance).first
      render :new
    end
  end


  def index
    @user = User.find(params[:user_id])
    @accounts = Account.all
  end

  def edit
  end

  def update
  end

  def destroy
    @account = Account.find(params[:id])
    @user = User.find(params[:user_id])
    @account.delete
    redirect_to user_accounts_path(@user)
  end

  def show
    @account = Account.find(params[:id])
  end

  private

  def account_params
    params.require(:account).permit(:type_of_account, :balance, :user_id)
  end
end
