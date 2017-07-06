module Sightengine
  module Api
    module Responses
      module Celebrity
        def celebrities
          faces.map { |face|
            face["celebrity"] || []
          }.flatten
        end

        def celebrity?(min_prob = 0.95)
          self.faces.any? { |face|
            face["celebrity"].any? { |c|
              c["prob"] >= min_prob
            }
          }
        end
      end
    end
  end
end