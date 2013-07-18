module ForemanDB
  class Query
    def search(search_query)
      query("/hosts?search=#{search_query}")
    end

    def host(id)
      query("/hosts/#{id}")
    end

    def query(search_query)
      foreman_request = ForemanDB::Request.new
      response = foreman_request.request(search_query).body
      foreman_parser = ForemanDB::Parser.new
      return foreman_parser.parse(response)
    end
  end
end
