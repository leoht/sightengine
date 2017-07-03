module Sightengine
  module Api
    class Response
      attr_accessor :status, :request, :media, :error

      def initialize(hash)
        hash.each do |k, v|
          send("#{k}=", v) if methods.include?("#{k}=".to_sym)
        end
      end
    end
  end
end