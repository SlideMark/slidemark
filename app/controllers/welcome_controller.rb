class WelcomeController < ApplicationController
  helper WelcomeHelper
  
  def index
    @posts = Post.opened.recent.page(params[:page])
  end

  def about
  end
end
