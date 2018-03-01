require 'airborne'
require 'json'
require_relative 'specs'

S3_PATH = "https://s3.us-east-2.amazonaws.com/fcaapp-customcars"

describe 'should return the car object' do
  it 'when the chassis number is a valid one' do
    token = generateToken('user1')
    get API + '/car?chassisNumber=AAAAAAAAAAAAAAAAA', { 'Authorization' => 'Bearer ' + token }
    expect_status 200
    expect_json_types(chassisNumber: :string, year: :string, model: :int, version: :int, series: :int, productNumber: :int, fuelType: :string, color: {id: :string, name: :string}, type: :string, doorsCount: :int, items: :array_of_objects)
    expect_json(chassisNumber: 'AAAAAAAAAAAAAAAAA', year: '2017', model: 226, version: 106, series: 0, productNumber: 2261060, fuelType: 'FLEX', color: {id: "296", name: 'BRANCO AMBIENTE'}, type: 'FREEDOM', doorsCount: 4, items: [{id: '2187', description: 'Tampa traseira dupla com abertura elétrica'}])  
  end
end

describe 'should return an error' do
  it 'when the chassis number is invalid' do
    token = generateToken('user1')
    get API + '/car?chassisNumber=BBBBBBBBBBBBBBBBB', { 'Authorization' => 'Bearer ' + token }
    expect_status 404
    expect(body).to eq("[NotFound] object of type 'Car' was not found.")
  end

  it 'if there is no car in the request' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920}
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 400
    expect_json_types(:array)
    expect_json(["Missing required parameter \"car\" in the request body."])
  end

  it 'if the car have no chassisNumber informed' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :productNumber => 2261750, :color => { :id => "176", :name => "VERMELHO TRIBAL" } } }
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 400
    expect_json_types(:array)
    expect_json(["Missing required parameter \"chassisNumber\" inside the \"car\" in the request body."])
  end

  it 'if the car have no productNumber informed' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :chassisNumber => "AAAAAAAAAAAAAAAAA", :color => { :id => "176", :name => "VERMELHO TRIBAL" } } }
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 400
    expect_json_types(:array)
    expect_json(["Missing required parameter \"productNumber\" inside the \"car\" in the request body."])
  end

  it 'if the car have no color informed' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :chassisNumber => "AAAAAAAAAAAAAAAAA", :productNumber => 2261750 } }
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 400
    expect_json_types(:array)
    expect_json(["Missing required parameter \"color\" inside the \"car\" in the request body."])
  end

  it 'if the car have a color with no id informed' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :chassisNumber => "AAAAAAAAAAAAAAAAA", :productNumber => 2261750, :color => { :name => 'VERMELHO TRIBAL' } } }
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 400
    expect_json_types(:array)
    expect_json(["Missing required parameter \"id\" inside the \"color\" inside the \"car\" in the request body."])
  end

  it 'if an image was not created' do
    get S3_PATH + '/user2/AAAAAAAAAAAAAAAAA/0001.png'
    expect_status 403
    expect(body).to include("Access Denied")
  end
end

describe 'should return car image' do
  it 'when request to generate one image' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :chassisNumber => 'AAAAAAAAAAAAAAAAA', :color => { :id => '809', :name => 'VERMELHO TRIBAL'}, :productNumber => 2261750 } }
    post API + '/car/generateImages/1', post_body, {'Authorization' => 'Bearer ' + token}
    expect_status 200
    expect_json_types(:array)
    expect_json(["https://s3.us-east-2.amazonaws.com/fcaapp-customcars/user1/AAAAAAAAAAAAAAAAA/0001.png"])
  end
end

describe 'should return car images' do
  it 'when request to generate all images' do
    token = generateToken('user1')
    post_body = { :maxWidth => 1080, :maxHeight => 1920, :car => { :chassisNumber => 'AAAAAAAAAAAAAAAAA', :color => { :id => '809', :name => 'VERMELHO TRIBAL'}, :productNumber => 2261750 } }
    post API + '/car/generateImages', post_body, {'Authorization' => 'Bearer ' + token , 'Content-Type' => 'application/json'}
    expect_status 200
    expect_json_types(:array)
    expect_json_sizes(30)
    images = JSON.parse(body)

    for i in 1..30
      expect(images[i - 1]).to eq(S3_PATH + "/user1/AAAAAAAAAAAAAAAAA/%04d.png" % [i])
    end
  end
end

describe 'should return the image binary' do
  it 'if the image is requested' do
    get S3_PATH + '/user1/AAAAAAAAAAAAAAAAA/0001.png'
    expect_status 200
  end
end