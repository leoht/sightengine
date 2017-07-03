module Sightengine
  module Api
    module Base
      def check(image_url, models = [])
        do_check(image_url, models)
      end

      private

        def do_check(image_url, models)
          connection.get build_uri('check.json') do |req|
            req.headers[:content_type] = 'application/json'
            req.params = default_params.merge({ url: image_url, models: models.join(",") })
            p req.params.inspect
          end.body
        end
    end
  end
end
