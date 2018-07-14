class AccountsController < ApplicationController
  def new
   @account = Account.new
  end

  def create
    @account = Account.new
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
end
