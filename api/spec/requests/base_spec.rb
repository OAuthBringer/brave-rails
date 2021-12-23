require 'rails_helper'

# These specs are actually firing off real HTTP requests which is not
# really advisible for various reasons (namely CI/CD) but for the moment 
# I'm ignoring this

RSpec.describe "Application", type: :request do
  let(:url) { "https://swapi.dev/api" }
  let(:params) { { url: url } }

  describe "root" do
    before do
      get root_path
    end

    it "200" do
      expect(response).to have_http_status 200
    end
  end

  describe "swapi" do
    before do
      post swapi_path, params: params
    end

    it "200" do
      expect(response).to have_http_status 200
    end
  end
end
