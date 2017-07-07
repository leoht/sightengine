module Sightengine
  module Api
    module Responses
      module FaceAttributes
        def self.included(base)
          base.class_eval do
            attr_accessor :faces
          end
        end

        def get_faces
          (self.instance_variable_get("@faces") || []).map do |face|
            Sightengine::Api::FaceAttributes::Face.new(face)
          end
        end
      end
    end
  end
end