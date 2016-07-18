module Services
  class SupermarketAdapter
    def get_stores_by_zip(zipcode)
      response = Services::SupermarketClient.new.zip_search(zipcode)
      response.parsed_response["ArrayOfStore"]["Store"].each do |store|
        Store.create(name: store["Storename"], address: store["Address"], city: store["City"], state: store["State"], zip: store["Zip"], phone: store["Phone"], storeID: store["StoreId"])
      end
    end

    def get_store_items(storeid, item)

    end

end
end