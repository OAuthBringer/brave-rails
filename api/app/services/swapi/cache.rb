class Swapi::Cache
  def self.call(url)
    data = $redis.get(url)
    return JSON.parse(data) if data

    self.set(url)
  end

  def self.set(url)
    data = Swapi::Client.get(url) 
    $redis.set(url, data.to_json)

    data
  end
end
