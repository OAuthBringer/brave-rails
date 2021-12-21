class PeopleController < BaseController
  private

  def set_controller_state
    @model = Person
    @service = Swapi::People
  end
end
