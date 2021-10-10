require 'rails_helper'       #PARA TESTEAR NEWR
require 'request_helper'     #En Ubuntu:  rspec ./spec/requests/api/category_spec.rb
require 'swagger_helper'

RSpec.describe 'API::NewsController', type: :request do

    describe 'GET /categories' do     #only admin endpoint
        it 'returns list of categories' do
          category = FactoryBot.create(:category)
          get '/categories/', as: :json, headers: RequestHelper.auth_header
          expect(response).to have_http_status(:ok)
        end
      end

end