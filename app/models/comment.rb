class Comment < ApplicationRecord
  belongs_to :dogrun
  belongs_to :user

  validates :title, presence: true,length: { maximum:20 }
  validates :contents, presence: true,length: { maximum:100 }
end
