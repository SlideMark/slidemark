class Post < ActiveRecord::Base
  ST_OPEN = 1

  scope :recent , -> { order('created_at DESC') }
  scope :open?, -> { where(status: ST_OPEN) }
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :setting

  def open?
    self.status == ST_OPEN
  end
end
