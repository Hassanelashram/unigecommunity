class Category < ApplicationRecord
  has_many :posts
  has_many :users
  has_many :sub_category_posts, class_name: 'Post', foreign_key: 'sub_category_id'
  mount_uploader :catimage, CatimageUploader
  validates :parent_id, presence: false
  belongs_to :parent, :class_name => 'Category', optional: true
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :child_category_parent, :class_name => 'Category', optional: true
  has_many :sub_child_category, :class_name => 'Category', :foreign_key => 'child_category_parent_id'

  def sub_child_category_posts
    Post.where(child_category_parent_id: self.id)
  end
  def check_level_of_category?
    if self.parent_id.nil? && self.child_category_parent_id.nil?
      return 0
    end
    if self.parent_id.present? && self.child_category_parent_id.nil?
      return 1
    end
  end
end
