class SharesController < ApplicationController
  def show
    @share = Share.find(params[:id])
    render json: @share, include: ["stock", "user.shares"]
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
