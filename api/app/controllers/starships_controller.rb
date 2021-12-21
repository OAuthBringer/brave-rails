class StarshipsController < BaseController
  private

  def set_controller_state
    @model = Starship
    @service = ::Swapi::Starships
  end
end
