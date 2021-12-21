require 'rails_helper'

RSpec.describe "Starships", type: :request do
  let(:id) { 1 }
  let(:path) { starships_path }
  let(:resource_path) { starship_path(id) }

  describe "index" do
    before do
      get path
    end

    it "200" do
      expect(response).to have_http_status 200
    end
  end

  describe "show" do
    before do
      get resource_path
    end

    it "200" do
      expect(response).to have_http_status 200
    end
  end
end
