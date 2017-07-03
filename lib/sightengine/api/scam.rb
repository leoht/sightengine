module Sightengine
  module Api
    module Scam
      class Response < ::Sightengine::Api::Response
        attr_accessor :faces, :scam
        
        def scam?(min_prob = 0.8)
          scam["prob"].to_f > min_prob
        end
      end

      def scam(image_url)
        Response.new(do_check(image_url, ["scam"]))
      end
    end
  end
end