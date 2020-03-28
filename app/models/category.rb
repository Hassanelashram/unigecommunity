class Category < ApplicationRecord
  has_many :posts
  has_many :sub_category_posts, class_name: 'Post', foreign_key: 'sub_category_id'
  mount_uploader :catimage, CatimageUploader
  validates :parent_id, presence: false
  belongs_to :parent, :class_name => 'Category', optional: true
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
end
