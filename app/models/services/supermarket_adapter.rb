module Services
  class SupermarketAdapter
    def get_stores_by_zip(zipcode)
      response = Services::SupermarketClient.new.search(zipcode)
      byebug
      response.parsed_response["artists"]["items"].each do |item|
        Artist.create(name: item["name"], popularity: item["popularity"])
      end
    end
  end
end