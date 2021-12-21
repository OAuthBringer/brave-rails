class ApplicationController < ActionController::API
  def health
    render json: { success: true }, status: 200
  end
end
