module Sightengine
  module Api
    module Responses
      module Nudity
        def self.included(base)
          base.class_eval do
            attr_accessor :nudity
          end
        end

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
    end
  end
end