class AuthController < ApplicationController  
#include ActionController::HttpAuthentication::Token
  #skip_before_action :authenticate!

  #def authenticate_user
    # Authorization: Bearer <token>
    #token, _options = token_and_options(request)
    #decoded_token = decode(token)
    #user = decoded_token[0] [payload]
  # end

    def register
      user = User.new(register_params)
      if user.save 
        payload = { firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password }
        token = AuthenticationTokenService.encode(payload)
        decoded_token = AuthenticationTokenService.decode(token)
        #authenticate_user()
        #render json: user, status: :created
        render json: { user: user, token: token, decoded_token: decoded_token }, status: :ok
      else 
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def login
    end

    private
    def register_params
        params.permit(:firstName, :lastName, :email, :password)
    end

    #def login_params
    #  params.permit(:email, :password)
    #end
  
end
    
    