class User < ApplicationRecord
  has_one_attached :image
  has_many :dogruns, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  def liked_by?(dogrun_id)
    likes.where(dogrun_id: dogrun_id).exists?
  end
end
