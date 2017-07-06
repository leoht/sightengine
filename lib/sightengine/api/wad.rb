module Sightengine
  module Api
    module Wad
      def wad(image_url)
        Sightengine::Api::Response.new(do_check(image_url, ["wad"]))
      end
    end
  end
end