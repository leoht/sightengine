module Sightengine
  module Api
    class Response
      attr_accessor :status, :request, :media

      def initialize(hash)
        hash.each do |k, v|
          send("#{k}=", v)
        end
      end
    end
  end
end