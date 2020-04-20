class Post < ApplicationRecord
  acts_as_votable
  belongs_to :category
  belongs_to :sub_category, class_name: 'Category', foreign_key: 'sub_category_id'
  belongs_to :user
  has_many :comments
  mount_uploader :picture, PictureUploader
  mount_uploader :document, DocumentUploader
  mount_uploader :document_two, DocumentTwoUploader
  validates :user_id, presence: true
  validates :category, presence: true
  validates :sub_category, presence: true
  validate :picture_size
  validates :title, presence: true
  validates :body, presence: true
  has_many :comments

  private
  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
