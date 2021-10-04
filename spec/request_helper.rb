class RequestHelper
    require 'rails_helper'
    require 'faker'


def self.auth_header
    role = FactoryBot.create(:role, "id": "1") if Role.find_by("id": "1").nil?  
    user = FactoryBot.create(:user, "role_id": "1")
    token = JsonWebToken.encode(user_id: user.id,role_id: "1")
    headers = { 'Authorization' => 'Bearer ' + token }
    return headers
    #  JSON.parse(response.body)
end

def self.auth_noAdmin_header
    role = FactoryBot.create(:role, "id": "2") if Role.find_by("id": "2").nil? 
    user = FactoryBot.create(:user,"role_id": "2")
    token = JsonWebToken.encode(user_id: user.id,role_id: "2")    
    headers = { 'Authorization' => 'Bearer ' + token }
    return headers                    
end

#def self.noAdmin_id
#    auth_noAdmin_header
#    return user.id
#end



end