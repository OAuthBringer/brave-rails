require 'rails_helper'

RSpec.describe Starship, type: :model do
  describe "attributes" do
    it { should respond_to :data }
  end
end
