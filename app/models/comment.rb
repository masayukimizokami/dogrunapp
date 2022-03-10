class Comment < ApplicationRecord
  belongs_to :dogrun
  belongs_to :user

  validates :title, presence: true,length: { in: 3..20 }
  validates :contents, presence: true,length: { in: 3..50 }
end
