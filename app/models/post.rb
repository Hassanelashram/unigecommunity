class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true
end
