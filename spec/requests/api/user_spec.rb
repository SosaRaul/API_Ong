require 'rails_helper'       #PARA TESTEAR NEWR
require 'request_helper'     #En Ubuntu:  rspec ./spec/requests/api/user_spec.rb
require 'swagger_helper'

RSpec.describe 'API::UsersController', type: :request do  #me falta testear que se devuelva data tipo json, y lo que devuelven los response.body.. 

  # el #index es endpoint publico: sin token ni nada
  # el #show, #update, #create, #destroy, debo ser admin

describe 'GET /users' do     #only admin endpoint
  it 'returns all users' do
    user = FactoryBot.create(:user)
    get '/users/', as: :json, headers: RequestHelper.auth_header
    expect(response).to have_http_status(:ok)
  end
end

describe 'PUT /users/:id' do  
context 'when user with given id exists and belongs to current_user' do
  it 'updates a user' do  
    user = FactoryBot.create(:user)
    my_user_id = (user.id)+1    
    put user_path(id: my_user_id), params: { user: {firstName: "new_user_name", lastName: "new_user_lastName",
                       password: "123", photo: "url_photo", role_id: "2"} }, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:ok)
  end      
end
context 'when  resourse does not exist or does not belong to id' do
  it 'returns not found status' do 
    user = FactoryBot.create(:user)
    put user_path(id: "1"), as: :json, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:forbidden)
  end   
end
context 'when @current_user is not logged' do 
  it 'returns 401 status' do 
    user = FactoryBot.create(:user)
    get user_path(id: user.id), as: :json
    expect(response).to have_http_status(:forbidden)
  end
end
end

describe 'DELETE /users/:id' do  
context 'when resource is found and belongs to current_user' do  
  it 'deletes a user' do 
    user = FactoryBot.create(:user)
    my_user_id = (user.id)+1 
    
    delete user_path(id: my_user_id), as: :json, headers: RequestHelper.auth_noAdmin_header 
    
    expect(response).to have_http_status(:ok)
  end
end
context 'when resource does not exist' do  
  it 'responds with 422 status' do 
    delete user_path(id: "0"), as: :json, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:forbidden)
  end
end 
context 'when @current_user is not logged or does not belong to current_user' do 
  it 'returns 401 status' do 
    user = FactoryBot.create(:user)
    get user_path(id: user.id), as: :json
    expect(response).to have_http_status(:forbidden)
  end
end
end

end
