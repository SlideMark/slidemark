class Post < ActiveRecord::Base

  ST_OPEN = 1
  after_save :screen_shot
  scope :recent , -> { order('created_at DESC') }
  scope :opened, -> { where(status: ST_OPEN) }
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def cover_page_url
    'http://upload.wikimedia.org/wikipedia/ms/3/35/Starbucks_Coffee_Logo.svg'
  end

  def open?
    self.status == ST_OPEN
  end

  def screen_shot
    self.content.split(/--/)[0]
  end
end
