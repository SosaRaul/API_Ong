class AuthController < ApplicationController  

#before_action :authorize_request, except: :login
before_action :authorize_request, except: %i[register login]

  # Registro
  # POST /auth/register
  def register
    @user = User.create(register_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  # Login
  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                      username: @user.email }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
  



  private

  def login_params
    params.permit(:email, :password)
  end
  
  def register_params
    params.permit(:id, :firstName, :lastName, :email, :password, :photo, :role_id) 
  end   

end

    
  