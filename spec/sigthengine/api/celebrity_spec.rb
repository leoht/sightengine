require "spec_helper"

describe Sightengine::Api::Celebrity do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect celebrity' do
    @client.mock('celebrities', 'celebrity.jpg', {
      result: 'success',
      faces: [
        {
          celebrity: [{ name: "John Doe", prob: 0.99 }]
        }
      ]
    })

    expect(@client.celebrities("celebrity.jpg").celebrity?).to eq true
    expect(@client.celebrities("celebrity.jpg").celebrities.length).to eq 1
  end

  it 'should not detect celebrity' do
    @client.mock('celebrities', 'someone.jpg', {
      result: 'success',
      faces: [
        {
          celebrity: [{ name: "John Doe", prob: 0.02 }]
        }
      ]
    })

    expect(@client.celebrities("someone.jpg").celebrity?).to eq false
  end
end