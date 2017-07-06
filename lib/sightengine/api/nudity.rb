module Sightengine
  module Api
    module Nudity
      def nudity(image_url)
        Sightengine::Api::Response.new(do_check(image_url, ["nudity"]))
      end
    end
  end
end
