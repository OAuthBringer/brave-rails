class ApplicationController < ActionController::API
  respond_to :json

  def index
    render json: { success: true }, status: 200
end
