module Sightengine
  module Api
    module Nudity
      class Response < Sightengine::Api::Response
        attr_accessor :nudity

        def raw_nudity?(min_prob = 0.9)
          nudity["raw"].to_f >= min_prob.to_f
        end

        def partial_nudity?(min_prob = 0.9)
          nudity["partial"].to_f >= min_prob.to_f
        end

        def safe?(min_prob = 0.9)
          nudity["safe"].to_f >= min_prob.to_f
        end
      end

      def nudity(image_url)
        Response.new(do_check(image_url, ["nudity"]))
      end
    end
  end
end
