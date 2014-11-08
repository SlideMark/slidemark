class Post < ActiveRecord::Base
  ST_OPEN = 1

  scope :recent , -> { order('created_at DESC') }
  scope :open?, -> { where(status: ST_OPEN) }
  #validates :title, present: true, length: [0..255]
  validate :content, presents: true

  belongs_to :user

  def open?
    self.status == ST_OPEN
  end
end
