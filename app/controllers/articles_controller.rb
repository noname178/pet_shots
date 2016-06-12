class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show]

  def show
    @tags = @article.tags
    @comments = @article.comments.includes(:user)
    @comment = Comment.new
    @articles = @article.user.articles.limit(3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @articles = Article.includes(:user).where('title LIKE(?) or description LIKE(?)', "%#{search_params}%", "%#{search_params}%")
    render template: 'home/index'
  end

  private

    def search_params
      params.permit(:keyword)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params
        .require(:article)
        .permit(:title, :description, :tag_list, image_attributes: [:id, :name])
        .merge(user_id: current_user.id)
    end
end
