class Articles::RecentController < ApplicationController
  def index
    @articles = Article.includes(:user).order(created_at: :desc)
    render template: 'home/index'
  end
end
