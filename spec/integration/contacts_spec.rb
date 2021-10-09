require 'rails_helper'

require 'swagger_helper'

RSpec.describe 'contacts API', type: :request do 
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
    end

    #  let(:id) { Contact.create(name: 'Juan', email:'juan@juan.com', phone:'511111').id }
    #    run_test!
    #  end
  
    response '404', 'contact not found' do
      let(:id) { 'invalid' }
      run_test!
    end

    response '401', 'forbbiden' do
      let(:contact) { { title: 'foo'} }
      run_test!
    end
    end
    end
  end

  RSpec.describe 'contacts API', type: :request do 
  path '/contacts' do
    post 'Creates a contact' do
      tags 'contacts'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :contact, in: :body, description: 'Info about contact to be create',
      schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :integer },
          message: {type: :string}
        },
        required: [ 'name', 'email' ,'phone','message']
      }

      response '201', 'contact created' do
        let(:contact) { { title: 'foo', description: 'bar' } }
        run_test!
      end

      response '404', 'not found' do
        let(:contact) { { title: 'foo'} }
        run_test!
      end

      response '401', 'forbbiden' do
        let(:contact) { { title: 'foo'} }
        run_test!
    end
  end
end
end