class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show

  end

  def destroy

  end

  def create

  end


end
