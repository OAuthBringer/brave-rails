class RefreshCacheJob < ApplicationJob
  queue_as :default

  def perform(url)
    Swapi::Cache.set(url)
  end
end
