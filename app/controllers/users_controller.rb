class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :authorize_request
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :verify_user_is_admin, only: [:index]

  # GET /users
  def index
    @users = User.all
    render json: @users,  status: :ok
  end
=======
before_action :authorize_request
before_action :find_user, only: [:show, :update, :destroy]
before_action :verify_user_is_admin, only: [:index]
# Hasta aca cada usuario solo puede hacer las operaciones asociadas a el 
# No puede borrar ni ver a otros usuarios (esto lo maneja al comparar el campo id del token)
# Queda hacer que el administrador sea el unico que pueda listar todos los usuarios 
# Al administrador le pondría id = 0
# GET /users
def index
  @users = User.all
  render json: @users,  status: :ok
end

# GET /users/1
def show
  render json: @user,  status: :ok
end
>>>>>>> f9217000d2b9a14430ce429e5df39eab627b9bd8

# PATCH/PUT /users/1
def update
  if @user.update(user_params)
    render json: @user,  status: :ok
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# DELETE /users/id
def destroy
  @user.destroy
  if @user.destroy
    render json: { message: "user deleted"}, status: :ok
  end
end

private

  private

  def find_user
    if(@current_user.role_id == 1)
      @user = User.find(params[:id].to_i)
    else
      if(params[:id].to_i == @current_user.id)
        @user = User.find(@current_user.id)
      else
        render json: {message: "No permitted"}, status: :forbidden
      end  
    end
  end     
    
  def user_params
    params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :photo, :role_id) 
  end

end

