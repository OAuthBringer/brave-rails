class ApplicationController < ActionController::API
  def health
    render json: { success: true }, status: 200
  end

  # I'm just going to blatantly proxy so I can easily handle all cases
  def swapi
    render json: { data:  Swapi::Cache.call(params.require(:url))}, status: 200
  end

  private

  # TODO: Implement expiry/refresh options
  def permitted_params
    params.permit(:expiry, :refresh)
  end
end
