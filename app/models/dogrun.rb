class Dogrun < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
  has_one_attached :image

  validates :dogrun_name, presence: true ,length: { in: 1..30 } 
  validates :address, presence: true,length: { in: 3..50 }
  validates :pr, presence: true,length: { in: 3..50 }
  validates :area, presence: true
end
