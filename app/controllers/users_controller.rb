class UsersController < ApplicationController
  before_action :check_self
  respond_to :html
  load_and_authorize_resource

  # for all
  def home
    @posts = Post.recent.page(params[:page]).per(20)
    respond_with(@posts)
  end

  # for self
  def list
    @posts = current_user.posts
    respond_with(@posts)
  end

  private
    def post_params
      params.require(:post).permit(:title)
    end

    def check_self
      if current.nil? || (current_user.id != params[:user_id])
        raise CanCan::AccessDenied
      end
    end
end
