module Sightengine
  module Api
    module Scam
      def scam(image_url)
        Sightengine::Api::Response.new(do_check(image_url, ["scam"]))
      end
    end
  end
end