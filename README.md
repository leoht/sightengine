# Sightengine

Unofficial wrapper for the [Sightengine](https://sightengine.com/) API
which provides image moderation including nudity detection, scammer detection,
face attributes, and more.

Official API docs can be found here: https://sightengine.com/docs/reference

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sightengine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sightengine

## Usage

### Configuration

```ruby
require 'sightengine'

client = Sightengine::Client.new(
  api_user: 'your api user',
  api_secret: 'your api secret'
)

```

### Nudity check

```ruby
response = client.nudity("https://sightengine.com/assets/img/examples/example2.jpg")

response.raw_nudity? # false
response.partial_nudity? # false
response.safe? # true
```

### Face attributes

```ruby
response = client.face_attributes("https://sightengine.com/assets/img/examples/example7.jpg")

response.faces.length # 1
face = response.faces.first

face.female? # true
face.male? # true
face.minor? # false
face.coordinates # [x1, y1, x2, y2] = [0.5156, 0.1936, 0.6922, 0.6207]
```

### Scam detection

```ruby
response = client.scam("https://d3m9459r9kwism.cloudfront.net/img/examples/example-scam1-1000.jpg")

response.scam? # true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/leoht/sightengine.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

