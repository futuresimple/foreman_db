module ForemanDB
  class Request
    def request(path)
      http = prepare_http
      request = prepare_request(path)
      http.request(request)
    end

    def prepare_http
      uri = URI.parse(Config.foreman_url)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE # FIXME this should be fixed on host
      end
      http
    end

    def prepare_request(path)
      request = Net::HTTP::Get.new(URI.escape(path))
      request.basic_auth(Config.foreman_user, Config.foreman_pass)
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request
    end
  end
end
