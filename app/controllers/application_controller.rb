class ApplicationController < ActionController::API
  # Setear host
  include ActiveStorage::SetCurrent
  
  def not_found
    render json: { error: 'not_found' }
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

  def verify_user_is_admin  
    if @current_user.role_id == 2 #role:2 belongs to a regular user. this method must me put below of authorize_request..
      render status: :forbidden
    end
  end

end


