require 'rails_helper'

describe Swapi::Client do
  let(:service) { described_class }
  let(:params) { "/planets" }
  let(:instance) { service.new(params) }

  describe "initialize" do
    context "when valid" do
      it "should return self" do
        expect(instance).to be_an service
      end
    end

    context "when invalid" do
      let(:params) { nil } 

      it "should raise an exception" do
        expect{ instance}.to raise_exception ArgumentError
      end
    end
  end

  describe "#index" do
    context "when valid" do
      it "should return json" do
        expect(instance.index).to be_an Hash
      end
    end

    context "when invalid" do
      let(:params) { "/notvalidpath" }
      it "should raise exception" do
        expect{ instance.show(1) }.to raise_exception Swapi::Client::RequestError
      end
    end
  end

  describe "#show" do
    context "when valid" do
      it "should return json" do
        expect(instance.show(1)).to be_an Hash
      end
    end

    context "when invalid" do
      let(:params) { "/notvalidpath" }
      it "should raise exception" do
        expect{ instance.show(1) }.to raise_exception Swapi::Client::RequestError
      end
    end
  end
end
