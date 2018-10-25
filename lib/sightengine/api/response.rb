require "sightengine/api/responses/nudity"
require "sightengine/api/responses/wad"
require "sightengine/api/responses/scam"
require "sightengine/api/responses/face_attributes"
require "sightengine/api/responses/celebrity"
require "sightengine/api/responses/offensive"

module Sightengine
  module Api
    class Response
      include Sightengine::Api::Responses::Nudity
      include Sightengine::Api::Responses::Wad
      include Sightengine::Api::Responses::Scam
      include Sightengine::Api::Responses::FaceAttributes
      include Sightengine::Api::Responses::Celebrity
      include Sightengine::Api::Responses::Offensive

      attr_accessor :status, :request, :media, :error

      def initialize(hash)
        hash.each do |k, v|
          send("#{k}=", v) if methods.include?("#{k}=".to_sym)
        end
      end
    end
  end
end
