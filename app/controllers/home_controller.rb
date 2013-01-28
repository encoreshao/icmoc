class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @article = Article.new
  end
end
