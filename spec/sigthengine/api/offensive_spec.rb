require "spec_helper"

describe Sightengine::Api::Offensive do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect offensive' do
    @client.mock('offensive', 'offensive.jpg', {
      result: 'success',
      offensive: { prob: 0.98 }
    })

    expect(@client.offensive("offensive.jpg").offensive?).to eq true
  end

  it 'should be ok' do
    @client.mock('offensive', 'ok.jpg', {
      result: 'success',
      offensive: { prob: 0.02 }
    })

    expect(@client.offensive("ok.jpg").offensive?).to eq false
  end
end
