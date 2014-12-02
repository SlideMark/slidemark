module WelcomeHelper
  def cache_key_for_public_posts
    count          = Post.count
    max_updated_at = Post.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "public-posts/all-#{count}-#{max_updated_at}"
  end
end
