class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :habit

  validates :content, presence: true
end
