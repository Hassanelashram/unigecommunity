class Category < ApplicationRecord
  has_many :posts
  mount_uploader :catimage, CatimageUploader
end
