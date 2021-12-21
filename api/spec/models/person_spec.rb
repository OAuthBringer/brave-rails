require 'rails_helper'

RSpec.describe Person, type: :model do
  describe "attributes" do
    it { should respond_to :data }
  end
end
