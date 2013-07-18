module ForemanDB
  class Host
    attr_accessor :id, :attributes

    def initialize(id)
      self.id = id
    end

    def self.find_by_id(id)
      host = self.new(id)
      host.fetch
      host
    end

    def fetch
      query = ForemanDB::Query.new
      self.attributes = query.host(id)
    end
  end
end
