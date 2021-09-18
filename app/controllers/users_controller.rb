class UsersController < ApplicationController
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
    @user.soft_delete
    if @user.soft_deleted?
      render json: { message: "user deleted"}, status: :ok
    end
  end

  private

  def find_user  
    if(params[:id].to_i == @current_user.id)
      @user = User.find(@current_user.id)
     #rescue ActiveRecord::RecordNotFound
    else
      render status: :forbidden
    
    end
  end

  def user_params
    params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :photo, :role_id) 
  end

end
