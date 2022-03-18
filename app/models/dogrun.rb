class Dogrun < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
  has_one_attached :image
  has_many :likes
  validates :dogrun_name, presence: true ,length: { maximum: 30 } 
  validates :address, presence: true,length: { maximum:50 }
  validates :pr, presence: true,length: { maximum:70 }
  validates :area, presence: true
end
