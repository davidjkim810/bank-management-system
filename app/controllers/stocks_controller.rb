class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html
      format.json {render :json => @stocks}
    end

  end

  def create
    @user = User.find(params[:user_id])
    @stock = Stock.new
    redirect_to user_shares_path(@user)
  end


end
