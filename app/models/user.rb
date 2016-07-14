class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  
  has_one :author
  has_one :reader






end
