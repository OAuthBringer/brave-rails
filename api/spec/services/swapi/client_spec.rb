require 'rails_helper'

describe Swapi::Client do
  let(:service) { described_class }
  let(:params) { "https://swapi.dev/api/people/" }

  describe "call" do
    context "when valid" do
      it "should return data" do
        expect(service.get(params)).to be_an Hash
      end
    end

    context "when invalid" do
      let(:params) { "https://swapi.dev/api/people/0" }

      it "should raise exception" do
        expect{ service.get(params) }.to raise_exception Swapi::Client::RequestError
      end
    end
  end
 end
