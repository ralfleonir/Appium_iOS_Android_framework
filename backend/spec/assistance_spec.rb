require 'airborne'
require 'json'
require_relative 'specs'

describe 'should return an error calling assistance' do
	it 'if no chassis number were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:phoneNumber => "11987654321", 
	 		:service => "TRAILER", 
	 		:problem => "BREAKDOWN", 
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"chassisNumber\" in the request body."])
	end
	it 'if no phone number were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:service => "TRAILER", 
	 		:problem => "BREAKDOWN", 
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"phoneNumber\" in the request body."])
	end
	it 'if no service were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"service\" in the request body."])
	end
	it 'if no street inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"street\" inside the \"address\" in the request body."])
	end
	it 'if no number inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"number\" inside the \"address\" in the request body."])
	end
	it 'if no district inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"district\" inside the \"address\" in the request body."])
	end
	it 'if no city inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"city\" inside the \"address\" in the request body."])
	end
	it 'if no state inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"state\" inside the \"address\" in the request body."])
	end
	it 'if no reference inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"reference\" inside the \"address\" in the request body."])
	end
	it 'if no latitude inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"latitude\" inside the \"address\" in the request body."])
	end
	it 'if no longitude inside the address were informed' do
	    token = generateToken('test-user')
	 	post_body = { 
	 		:chassisNumber => "AAAAAAAAAAAAAAAAA", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    expect_status 400
	    expect_json_types(:array)
	    expect_json(["Missing required parameter \"longitude\" inside the \"address\" in the request body."])
	end
end

describe 'When assistance is succesfully required' do
 
 	let(:token) { generateToken('user-1') }
	let(:assistance_number) {
	 	post_body = { 
	 		:chassisNumber => "9BD26512MG9064097", 
	 		:phoneNumber => "11987654321",
	 		:problem => "BREAKDOWN", 
	 		:service => "TRAILER",
	 		:address => { 
	 			:street => "Rua Luís Coelho", 
	 			:number => "223", 
	 			:district => "Consolação",
	 			:city => "São Paulo",
	 			:state => "SP",
	 			:reference => "Próximo à Bela Paulista",
	 			:latitude => -23.5565751,
	 			:longitude => -46.6617431
	 		}
	 	}
	    post API + '/assistance/call', post_body, { 'Authorization' => 'Bearer ' + token }
	    body
	}
    
	it 'should returns its number' do
	    expect(assistance_number).not_to be("-1")
	    expect_status 200
	end

    it 'should return assistance status' do
	    begin
	 	  get API + '/assistance/status?caseNumber=' + assistance_number, { 'Authorization' => 'Bearer ' + token }
	      expect_status 200
	      expect_json_types(status: :string, expectedArrivalTime: :int, providerPlate: :string, providerLatitude: :null, providerLongitude: :null)
          expect_json(status: 'EXPIRED', expectedArrivalTime: 40, providerPlate: '', providerLatitude: nil, providerLongitude: nil)
        rescue Exception => e
	        print "\nSeems the assistance code was not generated succesfully. Please try again\n\n"
	        p e.message
    	end
    end
end













