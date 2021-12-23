require 'rails_helper'

describe Swapi::Cache do
  let(:service) { described_class }
  let(:params) { "https://swapi.dev/api/people/" }

  describe "call" do
    context "when valid" do
      before do
        service.call(params)
      end

      it "should set the cache value" do
        expect($redis.get(params)).to be_truthy
      end
    end

    context "when invalid" do
      let(:params) { "https://swapi.dev/api/people/0" }

      it "should raise exception" do
        expect{ service.call(params) }.to raise_exception Swapi::Client::RequestError
        expect($redis.get(params)).to be_falsey
      end
    end
  end
 end
