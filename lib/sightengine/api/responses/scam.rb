module Sightengine
  module Api
    module Responses
      module Scam
        def self.included(base)
          base.class_eval do
            attr_accessor :faces, :scam
          end
        end

        def scam?(min_prob = 0.8)
          scam["prob"].to_f > min_prob
        end
      end
    end
  end
end