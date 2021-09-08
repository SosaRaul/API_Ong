class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent

  #before_action :authenticate_user!

  private

  #def authenticate_user!
    # Authorizations: Bearer <token>
  #  header = request.headers['token']
  #  header = header.split('Bearer')&.last if header
  #  @decoded = AuthenticationTokenService.decode(header)
  #  @current_user = User.find(@decoded[:email])
       # token, _options = token_and_options(request)
  #rescue ActiveRecord::RecordNotFound
  #  render status: :unauthorized
  #end

end


