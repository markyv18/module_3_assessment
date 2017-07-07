class SearchController < ApplicationController
  def index
    @stores = Store.stores(params[:zip])
  end
end
