class AuthController < ApplicationController  
#include ActionController::HttpAuthentication::Token
  #skip_before_action :authenticate_user!

    # REGISTER
    def register
      user = User.new(register_params)
      if user.save 
        payload = { firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password }
        token = AuthenticationTokenService.encode(payload)
        decoded_token = AuthenticationTokenService.decode(token)
        response.headers["token"] = token   #para pasar el token generado en el header
        render json: user, status: :created
        #render json: { user: user, token: token, decoded_token: decoded_token }, status: :ok
      else 
        render json: user.errors, status: :unprocessable_entity
      end
    end


  private
    def register_params
        params.permit(:firstName, :lastName, :email, :password)
    end

end

    
    