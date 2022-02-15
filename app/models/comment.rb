class Comment < ApplicationRecord
    belongs_to :dogrun
    belongs_to :user

    validates :title, presence: true
    validates :contents, presence: true
end
