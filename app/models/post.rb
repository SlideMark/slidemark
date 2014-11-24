class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  ST_OPEN = 1
  SEED = 'Ting'
  QR_SIZE = 300

  after_save :screen_shot
  scope :recent , -> { order('created_at DESC') }
  scope :opened, -> { where(status: ST_OPEN) }
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def cover_page_url
    'http://upload.wikimedia.org/wikipedia/ms/3/35/Starbucks_Coffee_Logo.svg'
  end

  def qr_image_path
    'assets/images/qrcode/' + Digest::MD5.hexdigest(SEED + self.id.to_s) + '.png'
  end

  def open?
    self.status == ST_OPEN
  end

  def publish
    if self.update(status: ST_OPEN)
      qr = RQRCode::QRCode.new(post_path(self), :size => 4, :level => :h )
      png = qr.to_img
      png.resize(QR_SIZE, QR_SIZE).save('public/' + self.qr_image_path)
    end
  end

  def screen_shot
    #browser = Capybara::Webkit::Driver.new('web_capture').browser
    #browser.visit 'http://qiita.com/'
    #browser.render('qiita.png', 1280, 650)
  end
end
