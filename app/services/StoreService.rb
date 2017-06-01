class StoreService

  def self.stores(zip)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,phone,city,distance&pageSize=10&apiKey=#{ENV["BB_API_KEY"]}")
    stores = JSON.parse(response.body, symbolize_names: true) [:stores]
  end
end
