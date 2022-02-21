class Dogrun < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :dogrun_name, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :pr, presence: true
  validates :area, presence: true
end
