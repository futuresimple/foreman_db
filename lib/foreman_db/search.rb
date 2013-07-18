module ForemanDB
  class Search
    attr_accessor :query, :results

    def initialize(query)
      self.query = query
      self.results = []
    end

    def self.search(query)
      search = self.new(query)
      search.fetch
      search
    end

    def fetch
      q = ForemanDB::Query.new
      self.results = []
      q.search(self.query).each do |host|
         self.results << Host.find_by_id(host["id"])
       end
    end
  end
end
