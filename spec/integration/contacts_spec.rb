require 'rails_helper'

require 'swagger_helper'

describe 'contacts API', type: :request do 
  path '/contacts' do 
    get 'Fetch contacts' do 
      tags 'contacts' 
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'List of contacts' do 
        schema type: :object,
        properties: {
        id: { type: :integer },
        name: { type: :string },
        phone: { type: :integer },
        email: {type: :string},  
        user: { type: :string}
      },
        required: [ 'id', 'name', 'phone','email','user' ]


      run_test! do |response|
        get '/contacts/', as: :json
        data = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
      end
      end
    end
  end


path '/contacts/{id}' do
  get 'Retrieves a contact ' do
    tags 'contacts'
    produces 'application/json'#, 'application/xml'
    security [Bearer: {}]
    parameter name: :Authorization, in: :header, type: :string
    parameter name: :id, :in => :path, :type => :string
  
    response '200', 'contact found' do
      schema type: :object,
      properties: {
      id: { type: :integer },
      name: { type: :string },
      phone: { type: :integer },
      email: {type: :string},  
      user: { type: :string}
    },
      required: [ 'id', 'name', 'phone','email' ]
  

     let(:id) { Contact.create(name: 'Juan', email:'juan@juan.com', phone:'511111').id }
       run_test!
     end
  
    response '404', 'contact not found' do
      let(:id) { 'invalid' }
      run_test!
    end

    response '401', 'forbbiden' do
      let(:news) { { title: 'foo'} }
      run_test!
    end
    end
    end
  end