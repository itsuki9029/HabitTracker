class User < ApplicationRecord
  has_many :habits, dependent: :destroy
  has_many :comments, dependent: :destroy
  # 自分がフォローしているユーザーとの関連
  has_many :active_follows, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_follows, source: :followee
  # 自分をフォローしているユーザーとの関連
  has_many :passive_follows, class_name: 'Follow', foreign_key: :followee_id, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower
  # フォローするメソッド
  def follow(other_user)
    following << other_user unless self == other_user
  end
  # フォロー解除するメソッド
  def unfollow(other_user)
    following.delete(other_user)
  end
  # フォローしているか確認するメソッド
  def following?(other_user)
    following.include?(other_user)
  end
  # 検索可能な属性を定義
  def self.ransackable_attributes(auth_object = nil)
    %w[username]
  end

  mount_uploader :profile_image, ProfileImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
