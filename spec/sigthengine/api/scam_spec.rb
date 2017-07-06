require "spec_helper"

describe Sightengine::Api::Nudity do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect scam' do
    @client.mock('scam', 'scam.jpg', {
      result: 'success',
      scam: { prob: 0.98 }
    })

    expect(@client.scam("scam.jpg").scam?).to eq true
  end

  it 'should be ok' do
    @client.mock('scam', 'ok.jpg', {
      result: 'success',
      scam: { prob: 0.02 }
    })

    expect(@client.scam("ok.jpg").scam?).to eq false
  end
end