require 'rails_helper'       #PARA TESTEAR NEWR
require 'request_helper'     #En Ubuntu:  rspec ./spec/requests/api/news_spec.rb
require 'swagger_helper'

RSpec.describe 'API::NewsController', type: :request do  #me falta testear que se devuelva data tipo json, y lo que devuelven los response.body.. 

  # el #index es endpoint publico: sin token ni nada
  # el #show, #update, #create, #destroy, debo ser admin

describe 'GET /news' do     #public endpoint
  it 'returns all news' do
    news = FactoryBot.create(:news)
    get '/news/', as: :json
    expect(response).to have_http_status(:ok)
  end
end
    
describe 'GET /news/:id' do   
context 'when news with given id exists' do
  it 'shows the news' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), :headers => RequestHelper.auth_header
    expect(response).to have_http_status(:ok)
  end
end  
#binding.pry
context 'when news with given id does not exist' do
  it 'returns not_found' do 
    get news_path(id: "200"), :headers => RequestHelper.auth_header
    expect(response).to have_http_status(:not_found)
  end
end
context 'when @current_user is not logged' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json
    expect(response).to have_http_status(:forbidden)
  end
end
context 'when @current_user is not admin' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:forbidden)
  end
end
#binding.pry
end

describe 'POST /news/' do  
  context 'with valid params' do
    it 'creates a news' do 
    news = FactoryBot.create(:news)
    expect {
           post news_index_path, params: { name: news.name, content: news.content }, headers: RequestHelper.auth_header
          }.to change { News.count }.from(News.count).to(News.count+1)
          expect(response).to have_http_status(:created)
   # put news_path(id: news.id), params: { name: "new_news_name", content: "new_news_content"}, headers: RequestHelper.auth_header
   # expect(response).to have_http_status(:ok)
    end      
  end

  context 'when @current_user is not logged' do 
    it 'returns 401 status' do 
      news = FactoryBot.create(:news)
      get news_path(id: news.id), as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end
  context 'when @current_user is not admin' do 
    it 'returns 401 status' do 
      news = FactoryBot.create(:news)
      get news_path(id: news.id), as: :json, headers: RequestHelper.auth_noAdmin_header
      expect(response).to have_http_status(:forbidden)
    end
  end
  end

describe 'PUT /news/:id' do  
context 'when news with given id exists' do
  it 'updates a news' do 
  news = FactoryBot.create(:news)
  put news_path(id: news.id), params: { name: "new_news_name", content: "new_news_content"}, headers: RequestHelper.auth_header
  expect(response).to have_http_status(:ok)
  end      
end
context 'when  resourse does not exist' do
  it 'returns not found status' do 
    news = FactoryBot.create(:news)
    put news_path(id: "33"), as: :json, headers: RequestHelper.auth_header
    expect(response).to have_http_status(:not_found)
  end   
end
context 'when @current_user is not logged' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json
    expect(response).to have_http_status(:forbidden)
  end
end
context 'when @current_user is not admin' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:forbidden)
  end
end
end

describe 'DELETE /news/:id' do  
context 'when resource is found' do  
  it 'deletes a news' do 
    news = FactoryBot.create(:news)
    expect {
      delete news_path(id: news.id), as: :json, headers: RequestHelper.auth_header 
      }.to change { News.count }.from(News.count).to(News.count-1)
    expect(response).to have_http_status(:ok)
  end
end
context 'when resource does not exist' do  
  it 'responds with 422 status' do 
    delete news_path(id: "0"), as: :json, headers: RequestHelper.auth_header
    expect(response).to have_http_status(:not_found)
  end
end 
context 'when @current_user is not logged' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json
    expect(response).to have_http_status(:forbidden)
  end
end
context 'when @current_user is not admin' do 
  it 'returns 401 status' do 
    news = FactoryBot.create(:news)
    get news_path(id: news.id), as: :json, headers: RequestHelper.auth_noAdmin_header
    expect(response).to have_http_status(:forbidden)
  end
end
end

end

