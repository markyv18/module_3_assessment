class Store
  attr_reader :store_type,
              :city,
              :name,
              :phone,
              :distance

  def initialize(params)
    @store_type = params[:storeType]
    @city = params[:city]
    @name = params[:longName]
    @phone = params[:phone]
    @distance = params[:distance]
  end

  def self.stores(zip)
    stores = StoreService.stores(zip)
    stores.map do |store|
      Store.new(store)
    end
  end
end
