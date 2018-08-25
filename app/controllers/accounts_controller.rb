class AccountsController < ApplicationController
  def new
    @account = Account.new
    @user = User.find(params[:user_id])
    if logged_in? && current_user == @user
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  def create
    @user = User.find(params[:user_id])
    if logged_in? && current_user == @user
      @account = @user.accounts.build(account_params)
      if @account.save
        redirect_to user_path(@user)
      else
        render :new
      end
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  def index
    @user = User.find(params[:user_id])
    @accounts = @user.accounts
    if logged_in? && current_user == @user
      render 'accounts/index', :layout => false
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @user = User.find(params[:user_id])
    @account.delete
    redirect_to user_accounts_path(@user)
  end

  def show
    @account = Account.find(params[:id])
    @user = @account.user
    if logged_in? && current_user == @user
    else
      flash[:message] = "Access Denied: Invalid User"
      redirect_to '/'
    end
  end

  private

  def account_params
    params.require(:account).permit(:type_of_account, :balance, :user_id)
  end
end
