module Sightengine
  module Api
    module Celebrity
      def celebrities(image_url)
        Sightengine::Api::Response.new(do_check(image_url, ["celebrities"]))
      end
    end
  end
end
