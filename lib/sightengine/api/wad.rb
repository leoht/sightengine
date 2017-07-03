module Sightengine
  module Api
    module Wad
      class Response < ::Sightengine::Api::Response
        attr_accessor :weapon, :drugs, :alcohol
        
        def weapon?(min_prob = 0.8)
          weapon.to_f > min_prob
        end

        def alcohol?(min_prob = 0.8)
          alcohol.to_f > min_prob
        end

        def drugs?(min_prob = 0.8)
          drugs.to_f > min_prob
        end
      end

      def wad(image_url)
        Response.new(do_check(image_url, ["wad"]))
      end
    end
  end
end