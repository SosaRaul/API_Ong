class UsersController < ApplicationController
  before_action :authorize_request
  before_action :find_user, only: [:show, :update, :destroy]
  before_action :verify_user_is_admin, only: [:index]

  # GET /users
  def index
    @users = User.all
    render json: @users,  status: :ok
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

