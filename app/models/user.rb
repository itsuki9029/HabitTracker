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
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:line] # LINE認証

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, allow_blank: true

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "dummy-email-#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  # Deviseの認証条件にusernameを追加
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (email_or_username = conditions.delete(:email))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: email_or_username.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
