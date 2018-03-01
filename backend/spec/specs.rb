require 'jwt'

API = 'https://e9rni84db1.execute-api.us-east-2.amazonaws.com/FCAAPP_STAGE'
SECRET = 'i?5A?twy#Gd@#x78r7a9w2/qm@7l^N~Y19h1jyh3_Kp>%Ut>),6/@@KE:0L^4wu'

def generateToken subject
	exp = Time.now.to_i + 3600
	payload = { :data => 'data', :sub => subject, :exp => exp }
	token = JWT.encode payload, SECRET, 'HS256'
end
