class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :verify_user_is_admin, only: [:index, :delete]

  # GET /categories
  def index
    render json: categories.to_json(only: [:id, :name]),  status: :ok
  end

  # GET /categories/1
  def show
    if @category.nil?
      render json: { error: "category not found" }, status: :not_found
    else
     render json: @category, status: :ok 
    end
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy   
    if  @category.nil?    
      render json: { error: "cannot destroy, it does not exist" }, status: :unprocessable_entity
    else  
      if @category.destroy
      render json: { message: "category destroyed"}, status: :ok
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by("id": params[:id]) 
    end

    def categories
      @category = Category.all.not_deleted
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:id, :name, :description, :image)
    end
end
