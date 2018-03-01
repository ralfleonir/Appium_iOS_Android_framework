require 'airborne'
require 'json'
require_relative 'specs'

describe 'should return the user object' do
  it "when it's id is a valid one" do
    token = generateToken('test-user')
    get API + '/user', { 'Authorization' => 'Bearer ' + token }
    expect_status 200
    expect_json_types(id: :string, name: :string, nickname: :string, imageUrl: :string, email: :string, cpf: :string, birthDay: :string, phoneNumber: :string, gender: :string, address: {postalCode: :string, street: :string, number: :string, addressComplement: :string, district: :string, city: :string, state: :string})
    expect_json(id: 'test-user', name: 'Test User', nickname: 'Test', imageUrl: 'https://www.path.to/image.png', email: 'testuser@fiat.com.br', cpf: '12345678989', birthDay: '1989-04-20', phoneNumber: '11999999999', gender: 'MALE', address: {postalCode: '01309001', street: 'Rua Luís Coelho', number: '800', addressComplement: '1w', district: 'Consolação', city: 'São Paulo', state: 'SP'})
  end
end

describe 'should return an error' do
  it 'when the user does not exists' do
  	token = generateToken('invalid-user')
  	get API + '/user', { 'Authorization' => 'Bearer ' + token }
  	expect_status 404
    expect(body).to eq("[NotFound] object of type 'User' was not found.")
  end
end

describe 'should create or update the user object' do
  it "when post it's to the API" do
    token = generateToken('test-user')
    get API + '/user', { 'Authorization' => 'Bearer ' + token }
    user = JSON.parse(body)

    user['id'] = nil
    user['nickname'] = 'Test1'
    post_body = user.to_json

    post API + '/user', post_body, { 'Authorization' => 'Bearer ' + token }
    expect_status 200
    expect_json(id: 'test-user', nickname: 'Test1')

    user['nickname'] = 'Test'
    post_body = user.to_json

    post API + '/user', post_body, { 'Authorization' => 'Bearer ' + token }
    expect_status 200
    expect_json(id: 'test-user', nickname: 'Test')
  end
end