require "spec_helper"

describe Sightengine::Api::Nudity do
  describe Sightengine::Api::Nudity::Response do
    it 'should indicate level of nudity' do
      raw_nudity_response = Sightengine::Api::Nudity::Response.new(
        "nudity" => {
          "raw" => 0.95,
          "partial" => 0.05,
          "safe" => 0.01
        }
      )

      partial_nudity_response = Sightengine::Api::Nudity::Response.new(
        "nudity" => {
          "raw" => 0.70,
          "partial" => 0.99,
          "safe" => 0.01
        }
      )

      safe_nudity_response = Sightengine::Api::Nudity::Response.new(
        "nudity" => {
          "raw" => 0.01,
          "partial" => 0.03,
          "safe" => 0.93
        }
      )

      expect(raw_nudity_response.raw_nudity?).to eq true
      expect(raw_nudity_response.safe?).to eq false
      expect(partial_nudity_response.partial_nudity?).to eq true
      expect(partial_nudity_response.safe?).to eq false
      expect(safe_nudity_response.safe?).to eq true
      expect(safe_nudity_response.raw_nudity?).to eq false
    end
  end
end