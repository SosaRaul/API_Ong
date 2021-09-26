class NewsController < ApplicationController
  before_action :set_news, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:show, :create, :destroy, :update]
  before_action :verify_user_is_admin, only: [:show, :create, :destroy, :update]

  # GET /news
  def index
    @news = News.all

    render json: @news
  end

  # GET /news/1
  def show
    render json: @news
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      render json: @news, status: :created, location: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/1
  def update
    if @news.update(news_params)
      render json: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /news/1
  def destroy
    @news.destroy
    render json: {message: "news deleted"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: "news not found" }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:name, :content, :softDelets, :categoryId)
    end
end
