class ApplicationController < ActionController::API
  before_action :set_url, only: [:swapi]
  after_action :refresh_cache, only: [:swapi], if: -> { response.status == 200 }

  def health
    render json: { success: true }, status: 200
  end

  # I'm just going to blatantly proxy so I can easily handle all cases
  def swapi
    render json: { data:  Swapi::Cache.call(@url)}, status: 200
  end

  private

  # Note: Could implement expiry/refresh options. In theory if we were using an LRU cache
  # we wouldn't really need to care we could just push out stale data over time.
  def permitted_params
    params.permit(:expiry, :refresh)
  end

  def set_url
    @url = params.require(:url)
  end

  # Cache is always updated asynchronously so we are nearly always up to date
  def refresh_cache
    RefreshCacheJob.perform_later(@url)
  end
end
