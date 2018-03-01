require 'airborne'
require_relative 'specs'

describe 'address endpoint' do
  it 'should return the address object' do
	token = generateToken('user1')
	get API + '/address?postalCode=01309001', { 'Authorization' => 'Bearer ' + token }
	expect_status 200
	expect_json_types(postalCode: :string, street: :string, district: :string, city: :string, state: :string, country: :string)
  	expect_json(postalCode: '01309001', street: 'Rua Luís Coelho', district: 'Consolação', city: 'São Paulo', state: 'SP', country: 'Brazil')
  end
end
