module ForemanDB
  class Parser
    def parse(raw_data)
      json_data = JSON.parse(raw_data)
      case json_data
      when Array
        json_data.map do |node|
          node["host"]
        end
      when Hash
        json_data["host"]
      end
    end
  end
end
