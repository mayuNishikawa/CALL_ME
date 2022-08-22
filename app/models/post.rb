class Post < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader
end
