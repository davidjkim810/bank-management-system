class SharesController < ApplicationController
  def show
    @share = Share.find(params[:id])
    render json: @share, include: ["stock", "user.shares"]
  end
end
