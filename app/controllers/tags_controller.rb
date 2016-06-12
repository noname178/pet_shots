class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
    render template: 'home/index'
  end

  def show
    @articles = Article.tagged_with(params[:id])
    render template: 'home/index'
  end
end
