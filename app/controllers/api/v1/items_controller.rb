class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.delete(params[:id])
  end

  def create
    # render plain: @good_thing.to_json, status: :ok, content_type: 'application/json'
    render plain: Item.create(item_params) #bang or no bang?
  end

  private

  def item_params
    params.permit(name:"bob", description:"is a great guy", image_url:"https://pbs.twimg.com/media/Ct29OhhUAAA7DbZ.jpg")
  end

end
