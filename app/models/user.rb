class User < ApplicationRecord
  has_one_attached :image
  has_many :dogruns
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
