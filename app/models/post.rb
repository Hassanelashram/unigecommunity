class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, presence: true
  validates :category, presence: true

  has_attached_file :document
  validates_attachment :document, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  has_attached_file :document_two
  validates_attachment :document_two, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
end
