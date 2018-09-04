class SharesController < ApplicationController
  def show
    @share = Share.find(params[:id])
    render json: @share, include: ["stock", "user.shares"]
  end

  def index
    @user = User.find(params[:user_id])
    @stocks = Stock.all
    @share = Share.new
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

end
