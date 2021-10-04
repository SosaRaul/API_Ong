require 'swagger_helper'

describe 'Categories API', type: :request do 
  path '/categories' do 
    get 'Fetch categories' do 
      tags 'Categories' 
      consumes 'application/json'
      produces 'application/json'
            
      response '200', 'List of news' do 
      schema type: :object,  properties: {
              category: {
              type: :object, 
              items: { '$ref' => '#/definitions/User' }   
                    }                    
                }

      let!(:news) { News.create(name: 'Ficcion', content: 'Contenido') }
                                       

      run_test! do |response|
        get '/categories/', as: :json
        data = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
      end
      end
    end
  end
    
  path '/categories/{id}' do
    get 'Retrieves a category (admins only)' do
      tags 'Categories'
      produces 'application/json'#, 'application/xml'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, :in => :path, :type => :string
    
      response '200', 'category found' do
      schema type: :object,
              properties: {
              id: { type: :integer },
              name: { type: :string },
              content: { type: :string }
              },
              required: [ 'id', 'name', 'content' ]

      let(:id) { Category.create(name: 'foo', content: 'bar').id }
        run_test!
      end
    
      response '404', 'category not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '401', 'forbbiden' do
        let(:news) { { title: 'foo'} }
        run_test!
      end
      end
      end

    path '/categories' do
        post 'Creates a category (admins only)' do
          tags 'Categories'
          consumes 'application/json'#, 'application/xml'
          security [Bearer: {}]
          parameter name: :Authorization, in: :header, type: :string
          parameter name: :news, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              image: { type: :string },
            },
            required: [ 'name', 'content' ]
          }
    
          response '201', 'category created' do
            let(:news) { { title: 'foo', content: 'bar' } }
            run_test!
          end
    
          response '404', 'not found' do
            let(:news) { { title: 'foo'} }
            run_test!
          end
    
          response '401', 'forbbiden' do
            let(:news) { { title: 'foo'} }
            run_test!
        end
      end
    end

      path '/categories/{id}' do
        put 'Updates a new (admins only)' do
          tags 'Categories'
          consumes 'application/json'#, 'application/xml'
          security [Bearer: {}]
          parameter name: :Authorization, in: :header, type: :string
          parameter name: :id, :in => :path, :type => :string
          parameter name: :news, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              image: { type: :string },
            },
            required: [ 'name', 'content' ]
          }
    
          response '200', 'OK: category updated' do
            let(:news) { { title: 'foo', content: 'bar' } }
            run_test!
          end

          response '404', 'not found' do
            let(:news) { { title: 'foo'} }
            run_test!
          end
    
          response '401', 'forbbiden' do
            let(:news) { { title: 'foo'} }
            run_test!
          end
        end
      end

      path '/categories/{id}' do
        delete 'Deletes a category (admins only)' do
          tags 'Categories'
          consumes 'application/json'#, 'application/xml'
          security [Bearer: {}]
          parameter name: :Authorization, in: :header, type: :string
          parameter name: :id, :in => :path, :type => :string
    
          response '201', 'category deleted' do
            let(:news) { { title: 'foo', content: 'bar' } }
            run_test!
          end
    
          response '404', 'not found' do
            let(:news) { { title: 'foo'} }
            run_test!
          end
    
          response '401', 'forbbiden' do
            let(:news) { { title: 'foo'} }
            run_test!
          end
        end
      end

      
end
