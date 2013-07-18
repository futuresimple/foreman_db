module ForemanDB
  class Config
    def self.foreman_url
      @foreman_url ||= ENV["FOREMAN_URL"]
    end

    def self.foreman_pass
      @foreman_pass ||= ENV["FOREMAN_PASS"]
    end

    def self.foreman_user
      @foreman_user ||= ENV["FOREMAN_USER"]
    end
  end
end
