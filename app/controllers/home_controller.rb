class HomeController < ApplicationController
  def index
    @articles = Article.includes(:tags)
  end
end
