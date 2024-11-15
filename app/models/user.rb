class User < ApplicationRecord
  has_many :habits, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :profile_image, ProfileImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
