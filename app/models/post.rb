class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  mount_uploader :picture, PictureUploader
  mount_uploader :document, DocumentUploader
  mount_uploader :document_two, DocumentTwoUploader
  validates :user_id, presence: true
  validates :category, presence: true
  validate :picture_size
  validates :title, presence: true
  validates :body, presence: true

  private
  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
