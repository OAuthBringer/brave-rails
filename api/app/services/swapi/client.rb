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
  # Obviously redundant, here for clarity
  @@path = nil

  def self.index
    Swapi::Client.new(@@path).index
  end

  def self.show(id)
    Swapi::Client.new(@@path).show(id)
  end

  def initialize(path, host: "https://swapi.dev/api")
    raise ArgumentError unless path
    @host = host
    @path = path 
    @url = "#{@host}#{@path}"
  end

  def index
    get
  end

  def show(id)
    # Sorry functional programmers ;)
    @url = "#{@url}/#{id}"
    get
  end

  private

  # Normally I would have a more generically defined client here, but in this case
  # I'm only using GET requests so I'm not over optimizing.
  def get
    response_handler(Net::HTTP.get_response(URI(@url)))
  end

  def response_handler(resp)
    raise Swapi::Client::RequestError.new(resp.code) unless resp.is_a?(Net::HTTPSuccess)
    JSON.parse(resp.body, symbolize_names: true)
  end
end
