require "spec_helper"

describe Sightengine::Api::Wad do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect weapon' do
    @client.mock('wad', 'weapon.jpg', {
      result: 'success',
      weapon: 0.98
    })

    expect(@client.wad("weapon.jpg").weapon?).to eq true
  end

  it 'should detect alcohol' do
    @client.mock('wad', 'alcohol.jpg', {
      result: 'success',
      alcohol: 0.98
    })

    expect(@client.wad("alcohol.jpg").alcohol?).to eq true
  end

  it 'should detect drugs' do
    @client.mock('wad', 'drugs.jpg', {
      result: 'success',
      drugs: 0.98
    })

    expect(@client.wad("drugs.jpg").drugs?).to eq true
  end
end