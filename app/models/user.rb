class User < ApplicationRecord
  acts_as_voter
  has_many :posts
  has_many :topics
  has_many :comments
  belongs_to :category
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
