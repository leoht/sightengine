require "spec_helper"

describe Sightengine::Api::Nudity do

  before :all do
    @client = MockClient.new(
      api_user: '1234',
      api_secret: 'abcdef'
    )
  end

  it 'should detect female face' do
    @client.mock('face-attributes', 'female.jpg', {
      result: 'success',
      faces: [
        {
          attributes: { female: 0.98, male: 0.02, minor: 0.03 }
        }
      ]
    })

    expect(@client.face_attributes("female.jpg").get_faces).to satisfy { |faces|
      faces.any? { |face| face.female? }
    }
  end

  it 'should detect male face' do
    @client.mock('face-attributes', 'male.jpg', {
      result: 'success',
      faces: [
        {
          attributes: { male: 0.98, female: 0.02, minor: 0.03 }
        }
      ]
    })

    expect(@client.face_attributes("male.jpg").get_faces).to satisfy { |faces|
      faces.any? { |face| face.male? }
    }
  end
end