class User::PostsController < UsersController
  respond_to :html
  load_and_authorize_resource
  layout 'ppt', only: ['show']

  def index
    @posts = current_user.posts.recent.page(params[:page])
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
    @post.update(post_params)
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
