require 'rails_helper'      
require 'request_helper'    
require 'swagger_helper'

RSpec.describe 'API::ContactsController', type: :request do

    describe 'GET /contacts' do     #only admin endpoint
        it 'returns list of contacts' do
          contact = FactoryBot.create(:contact)
          get '/contacts/', as: :json, headers: RequestHelper.auth_header
          expect(response).to have_http_status(:ok)
        end
      end

    
    describe 'POST /contacts' do  
        it 'create a contact' do
            expect {
                post '/contacts', headers: RequestHelper.auth_header,
                params: {contact: {name: "Raul", phone: 112356 ,email: "raul@example.com",message:"Hola!"}}                
            }.to change{Contact.count}.by(1)
            expect(response).to have_http_status(:created)            
        end
    end    

    describe 'DELETE /contacts/:id' do
        it 'delete a contact' do
            contact = FactoryBot.create(:contact)
            expect {
                delete "/contacts/#{contact.id}", headers: RequestHelper.auth_header
        }.to change{Contact.count}.by(-1)
        expect(response).to have_http_status(:ok)
        expect{contact.reload}.to raise_error(ActiveRecord::RecordNotFound)
        end
    end

    describe 'PUT /contacts/:id' do
        it 'update a contact' do
            contact = FactoryBot.create(:contact)
            put "/contacts/#{contact.id}" , headers: RequestHelper.auth_header,
            params: {contact: {name: "Raul", phone: 112356 ,email: "example@example.com",message:"Hola!"}}
            expect(response).to have_http_status(:ok)
        end
    end
end    