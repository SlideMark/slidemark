class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  ST_OPEN = 1

  QR_SEED = 'Ting'
  QR_SIZE = 300

  SCREEN_SEED = 'Zhang'
  SCREEN_WIDTH = 320
  SCREEN_HEIGHT = 220

  after_save :screen_shot
  scope :recent , -> { order('created_at DESC') }
  scope :opened, -> { where(status: ST_OPEN) }
  #validates :title, presence: true
  validates :content, presence: true

  belongs_to :user

  def cover_page_path
    '/assets/images/screenshot/' + Digest::MD5.hexdigest(SCREEN_SEED + self.id.to_s) + '.png'
  end

  def simple
    if self.content.present?
      return self.content.split(/^--/)[0]
    return nil
  end

  def cover_page_url
    self.open? ? self.cover_page_path : '/assets/images/not_published.png'
  end

  def qr_image_path
    'assets/images/qrcode/' + Digest::MD5.hexdigest(QR_SEED + self.id.to_s) + '.png'
  end

  def open?
    self.status == ST_OPEN
  end

  def publish
    if self.update(status: ST_OPEN)
      qr_code
    end
  end

  private

    def post_root
      if Rails.env.development?
        '127.0.0.1:3000'
      else
        'http://www.slidemark.net'
      end
    end

    def screen_shot
      return unless self.open?
      system("/usr/local/bin/wkhtmltoimage --height #{SCREEN_HEIGHT} --width #{SCREEN_WIDTH} --format png #{post_root+ simple_post_path(self)} - > #{'public/' + self.cover_page_path}")
      #kit = IMGKit.new(post_root+ post_path(self))
      #kit.to_file('public/' + self.cover_page_path)
    end

    def qr_code
      qr = RQRCode::QRCode.new(post_root + post_path(self), :size => 4, :level => :h )
      png = qr.to_img
      png.resize(QR_SIZE, QR_SIZE).save('public/' + self.qr_image_path)
    end
end
