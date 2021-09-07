class AuthController < ApplicationController  
  
      def register
        user = User.new(register_params)
        if user.save 
          render json: user, status: :created
        else 
          render json: user.errors, status: :unprocessable_entity
        end
      end
  
      private
      def register_params
          params.permit(:firstName, :lastName, :email, :password)
      end
  
    end
    
    