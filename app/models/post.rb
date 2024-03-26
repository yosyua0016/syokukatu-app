class Post < ApplicationRecord
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to :user
end