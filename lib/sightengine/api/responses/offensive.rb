module Sightengine
  module Api
    module Responses
      module Offensive
        def self.included(base)
          base.class_eval do
            attr_accessor :offensive
          end
        end

        def offensive?(min_prob = 0.9)
          offensive["prob"].to_f >= min_prob.to_f
        end
      end
    end
  end
end
