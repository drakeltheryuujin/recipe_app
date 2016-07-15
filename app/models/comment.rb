class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :reader
  belongs_to :recipe
end
