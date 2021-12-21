require 'rails_helper'

# These specs are actually firing off real HTTP requests which is not
# really advisible for various reasons (namely CI/CD) but for the moment 
# I'm ignoring this

RSpec.describe "People", type: :request do
  let(:path) { people_path }
  let(:id) { 1 }
  let(:resource_path) { person_path(id) }

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
