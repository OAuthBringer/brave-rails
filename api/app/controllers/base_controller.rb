class BaseController < ActionController::API
  before_action :set_controller_state

  def index
    render json: @service.index, status: 200
  end

  def show
    render json: @service.show(params.require(:id)), status: 200
  end

  private

  def set_controller_state
    raise NotImplementedError("Must set @service and @model")
  end
end
