class Articles::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_article, only: :create
  before_action :set_comment, only: :destroy

  def create
    @comment = @article.comments.new(comment_params)
    @comments = @article.comments.includes(:user)
    unless @comment.save
      render template: 'articles/show'
    end
  end

  def destroy
    @comment.destroy
    @comments = @comment.article.comments.includes(:user)
    render :create
  end

  private

    def set_article
      @article = Article.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id)
    end
end
