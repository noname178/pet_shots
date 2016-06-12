class Articles::PopularController < ApplicationController
  def index
    @articles = Article.includes(:user)
    render template: 'home/index'
  end
end
