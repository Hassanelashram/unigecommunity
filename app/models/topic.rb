class Topic < ApplicationRecord
  belongs_to :user
  has_many :opinions
end
