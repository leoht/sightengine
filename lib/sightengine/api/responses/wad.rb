module Sightengine
  module Api
    module Responses
      module Wad
        def self.included(base)
          base.class_eval do
            attr_accessor :weapon, :drugs, :alcohol
          end
        end

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
    end
  end
end