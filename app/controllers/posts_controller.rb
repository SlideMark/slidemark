class PostsController < ApplicationController
  respond_to :html
  load_and_authorize_resource
  layout 'ppt', only: ['show']

  def index
    @posts = Post.recent.page(params[:page])
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    @post.save
    respond_with(@post)
  end

  def update
    if @post.update(post_params)
      redirect_to edit_post_url, flash: {notice: I18n.t('model.post.update.success')}
      return
    end
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
