# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  #config.swagger_root = Rails.root.join('swagger').to_s 

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_root = Rswag::Api.config.swagger_root
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'Alkymers on Rails - ONG Grupo 73 - API V1',
        version: 'v1'
      },
      #basePath: 'http://localhost:3000',
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'localhost:3000'
            }
          }
        }
      ],
      definitions: {
        News: {
         type: 'object',
          properties: {
            id: { type: :integer, example: "1" },
            name: { type: :string, example: "NombreNews"},
            content: { type: :string, example: "ContenidoNews"}
          }
        },
        User: {
          type: 'object',
          properties: {
            id: { type: :integer, example: "1" },
            firstName: { type: :string, example: "NombreUsuario"},
            lartName: { type: :string, example: "ApellidoUsuario"},
            email: { type: :string, example: "EmailUsuario@example.com"},
            password: { type: :string, example: "passwordUsuario"}
          }
        },
        Category: {
          type: 'object',
          properties: {
            id: { type: :integer, example: "1" },
            firstName: { type: :string, example: "NombreUsuario"},
            lartName: { type: :string, example: "ApellidoUsuario"},
            email: { type: :string, example: "EmailUsuario@example.com"},
            password: { type: :string, example: "passwordUsuario"}
          }
        },
        ErrorResponse: {
          type: 'object',
          properties: {
            messages: {
              type: 'array',
              items: { type: 'string', example: "Error description" }
            }
          }
        },
        securityDefinitions: {
        Bearer: {
          description: "...",
          #type: :apiKey,
          name: 'Authorization',
          in: :header
        }
      },
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :json
end
