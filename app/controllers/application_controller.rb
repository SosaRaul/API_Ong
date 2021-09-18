class ApplicationController < ActionController::API
  # Setear host
  include ActiveStorage::SetCurrent
  
  def not_found
    render json: { error: 'not_found' }
  end

  def verify_user_is_admin  #debo modificarlo para no repetir codigo...
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      if @current_user.role_id != 1
        render status: :forbidden
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render status: :forbidden
    end
  end


  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render status: :forbidden
    end
  end

end


