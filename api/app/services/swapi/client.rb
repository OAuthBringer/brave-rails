class Swapi::Client
  class RequestError < StandardError
    attr_reader :code

    def initialize(code)
      @code = code
    end

    def message
     "Request failed with status #{@code}"
    end
  end

  @@path = nil

  # As I mulled this over I realized I can handle pretty much all cases fairly simply
  def self.get(url)
    self.response_handler(Net::HTTP.get_response(URI(url)))
  end

  def self.response_handler(resp)
    raise Swapi::Client::RequestError.new(resp.code) unless resp.is_a?(Net::HTTPSuccess)
    JSON.parse(resp.body, symbolize_names: true)
  end
end
