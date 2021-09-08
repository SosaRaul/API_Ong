class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent

  #before_action :authenticate!

  private

  #def authenticate!
  #  header = request.headers['Authorization']
  #  header = header.split('Bearer')&.last if header
  #  @decoded = AuthenticationTokenService.decode(header)
  #  @current_user = User.find(@decoded[:user_id])
  #end

end

