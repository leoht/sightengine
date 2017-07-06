require "spec_helper"

describe Sightengine::Api::Nudity do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect raw nudity' do
    @client.mock('nudity', 'raw.jpg', {
      result: 'success',
      nudity: { raw: 0.98, partial: 0.01, safe: 0.01 }
    })

    expect(@client.nudity("raw.jpg").raw_nudity?).to eq true
    expect(@client.nudity("raw.jpg").safe?).to eq false
  end

  it 'should detect raw nudity' do
    @client.mock('nudity', 'partial.jpg', {
      result: 'success',
      nudity: { raw: 0.01, partial: 0.98, safe: 0.01 }
    })

    expect(@client.nudity("partial.jpg").partial_nudity?).to eq true
    expect(@client.nudity("partial.jpg").safe?).to eq false
  end

  it 'should be safe' do
    @client.mock('nudity', 'safe.jpg', {
      result: 'success',
      nudity: { raw: 0.01, partial: 0.02, safe: 0.97 }
    })

    expect(@client.nudity("safe.jpg").raw_nudity?).to eq false
    expect(@client.nudity("safe.jpg").safe?).to eq true
  end
end