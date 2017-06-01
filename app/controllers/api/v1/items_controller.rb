class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy

  end

  def create
    render json: Item.create(item_params)
  end

  private

  def item_params
    params.permit(name:"bob", description:"is a great guy", image_url:"https://pbs.twimg.com/media/Ct29OhhUAAA7DbZ.jpg")
  end

end