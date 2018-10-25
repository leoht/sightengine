module Sightengine
  module Api
    module Offensive
      def offensive(image_url)
        Sightengine::Api::Response.new(do_check(image_url, ["offensive"]))
      end
    end
  end
end
