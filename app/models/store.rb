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
    stores = StoreService.stores_search(zip)

    total_number_of_stores = stores[:total]

    list_of_stores = stores[:stores].map do |store|
      Store.new(store)
    end

    [total_number_of_stores, list_of_stores]

  end

end



















#
