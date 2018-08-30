class SharesController < ApplicationController
  def show
    @share = Share.find(params[:id])
    render json: @share
  end
end
