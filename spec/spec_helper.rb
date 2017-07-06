require "bundler/setup"
require "sightengine"
require 'webmock/rspec'

class MockClient < Sightengine::Client
  include WebMock::API

  WebMock.enable!

  def mock(model, url, expected)
    stub_request(:get, build_uri('check.json')).
      with(query: {
        url: url,
        api_user: api_user,
        api_secret: api_secret,
        models: model
      }).
      to_return(body: expected.to_json)
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
