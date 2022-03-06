class User < ApplicationRecord
  has_one_attached :image
  has_many :dogruns, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
end
