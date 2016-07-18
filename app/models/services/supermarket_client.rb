module Services
  class SupermarketClient
    include HTTParty

    BASE_URL = "http://www.supermarketapi.com/api.asmx/StoresByZip?APIKEY=6615d53884"

    def search(zip)
      self.class.get(BASE_URL, {query: {ZipCode: zip}})
    end

  end
end