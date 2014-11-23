class Admin::PostsController < AdminController
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
    @post = Post.new.decorate
  end

  def edit
    @post = @post.decorate
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id)).decorate
    if @post.save
      redirect_to admin_user_posts_url, flash: {notice: I18n.t('model.post.create.success')}
      return
    end
    render :new
  end

  def update
    @post = @post.decorate
    if @post.update(post_params)
      redirect_to edit_admin_user_post_url, flash: {notice: I18n.t('model.post.update.success')}
      return
    end
    render :edit
  end

  def change_status
    @post.publish
    redirect_to admin_user_posts_path, flash: {notice: I18n.t('model.post.publish.success')}
  end

  def destroy
    @post.destroy
    redirect_to admin_user_posts_path, flash: {notice: I18n.t('model.post.delete.success')}
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :status, :s_controls, :s_progress, :s_slideNumber,
        :s_history, :s_keyboard, :s_overview, :s_center, :s_loop, :s_rtl, :s_fragments, :s_embedded, :s_autoSlide,
        :s_autoSlideStoppable, :s_mouseWheel, :s_hideAddressBar, :s_previewLinks, :s_transition,
        :s_transitionSpeed, :s_backgroundTransition, :s_theme, :s_viewDistance,
        :s_parallaxBackgroundImage, :s_parallaxBackgroundSize)
    end
end
