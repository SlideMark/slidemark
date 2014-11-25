class WelcomeController < ApplicationController
  def index
    @posts = Post.opened.recent.page(params[:page])
  end

  def about
  end
end
