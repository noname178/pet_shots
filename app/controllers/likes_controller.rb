class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: :create

  def create
    @like = @article.likes.create(user_id: current_user.id)
    @article = @like.article
  end

  def destroy
    @article = Article.find(params[:id])
    @like = @article.likes.find_by(user_id: current_user.id)
    @like.destroy
    @article = Article.find(params[:id])
    render :create
  end

  private

    def set_article
      @article = Article.find(params[:article_id])
    end
end
