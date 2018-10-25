require "sightengine/api/response"
require "sightengine/api/base"
require "sightengine/api/nudity"
require "sightengine/api/wad"
require "sightengine/api/face_attributes"
require "sightengine/api/scam"
require "sightengine/api/celebrity"
require "sightengine/api/offensive"

module Sightengine
  class Client
    include Sightengine::Connection
    include Sightengine::Api::Base
    include Sightengine::Api::Nudity
    include Sightengine::Api::Wad
    include Sightengine::Api::FaceAttributes
    include Sightengine::Api::Scam
    include Sightengine::Api::Celebrity
    include Sightengine::Api::Offensive

    BASE_URI = 'https://api.sightengine.com'.freeze

    VALID_OPTIONS = [
      :api_user,
      :api_secret,
      :api_version
    ].freeze

    attr_accessor *VALID_OPTIONS

    def initialize(**options)
      options.merge(default_options).each do |opt, value|
        send("#{opt}=", value)
      end
    end

    def build_uri(path, **params)
      "#{BASE_URI}/#{self.api_version}/#{path}"
    end

    def default_params
      { api_user: self.api_user, api_secret: self.api_secret }
    end

    def default_options
      { api_version: '1.0' }
    end
  end
end
