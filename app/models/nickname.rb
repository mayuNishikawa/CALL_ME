class Nickname < ApplicationRecord
  validates :content, presence: true, length: { maximum: 10 }
end
