class Artist < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  mount_uploader :singing, SingingUploader
  mount_uploader :play_video, PlayVideoUploader

  enum genre: { ロック:"1", メタル:"2", ジャズ:"3", 弾き語り:"4", シンガー:"5"}

  has_many :follows, foreign_key:"follower_id", dependent: :destroy
  has_many :reverse_follows, foreign_key:"followed_id", class_name: "Concern", dependent: :destroy

  has_many :followed_users, through: :follows, source: :followed
  has_many :followers, through: :reverse_follows, source: :follower

end
