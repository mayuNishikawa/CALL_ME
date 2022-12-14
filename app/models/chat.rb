class Chat < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  belongs_to :user
end
