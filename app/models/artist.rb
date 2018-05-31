class Artist < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :singing, SingingUploader
  mount_uploader :play_video, PlayVideoUploader

  enum genre: { ロック:"1", メタル:"2", ジャズ:"3", 弾き語り:"4", シンガー:"5"}

  has_many :follows, foreign_key:"follower_id", dependent: :destroy
  has_many :reverse_follows, foreign_key:"followed_id", class_name: "Follow", dependent: :destroy

  has_many :followed_users, through: :follows, source: :followed
  has_many :followers, through: :reverse_follows, source: :follower

  validate def check_image_dimensions
    unless geometry.blank?
      if geometry[:width] > 800 || geometry[:height] > 540
        errors.add :avatar, '800x540ピクセル以内のサイズの画像をアップロードしてください'
      end
    end
  end

  def geometry
    @geometry ||= _geometry
  end

  def _geometry
    if avatar.file and File.exists?(avatar.file.file)
      img = ::Magick::Image::read(avatar.file.file).first
      { width: img.columns, height: img.rows }
    end
  end

  def search(conditions, page)
    q = Artist.ransack(conditions)
    results = q.result.order(created_at: :asc)
    results = results.page(page).per(3)
  end

  def self.pickup_artist(back)
    if back
      artist = Artist.new(artist_params)
    else
      artist = Artist.new
    end
  end

  def self.get_loginUser(id)
    Artist.find_by(user_id: id)
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :self_introduction, :singing, :singing_cache, :play_video, :play_video_cache, :avatar, :avatar_cache)
  end

  def self.artist_params(params)
    params.require(:artist).permit(:name, :genre, :self_introduction, :singing, :singing_cache, :play_video, :play_video_cache, :avatar, :avatar_cache)
  end


end
