class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    @user = User.find(params[:user_id])
  end


end
