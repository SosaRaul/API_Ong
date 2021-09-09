class UsersController < ApplicationController
  #before_action :find_user, only: [:show, :update, :destroy]
  #before_action :authorize_request, except: :index
  #before_action :authorize_request, except: :login
  #before_action :find_user, except: :register
  before_action :find_user, except: :index

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
  # Use callbacks to share common setup or constraints between actions.
  
  def users
    @user = User.all.not_deleted
  end 
    
  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :photo, :role_id) 
  end          
end
