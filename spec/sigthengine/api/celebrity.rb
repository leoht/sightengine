require "spec_helper"

describe Sightengine::Api::Celebrity do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect celebrity' do
    @client.mock('celebrity', 'celebrity.jpg', {
      result: 'success',
      faces: [
        {
          celebrity: [{ name: "John Doe", prob: 0.99 }]
        }
      ]
    })

    expect(@client.celebrity("celebrity.jpg").celebrity?).to eq true
    expect(@client.celebrity("celebrity.jpg").celebrities.length).to eq 1
  end

  it 'should not detect celebrity' do
    @client.mock('celebrity', 'someone.jpg', {
      result: 'success',
      faces: [
        {
          celebrity: [{ name: "John Doe", prob: 0.02 }]
        }
      ]
    })

    expect(@client.celebrity("someone.jpg").celebrity?).to eq false
  end
end