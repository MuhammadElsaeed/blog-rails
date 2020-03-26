class Comment < ApplicationRecord
    validates :content, presence: true
    belongs_to :user, required: false
    belongs_to :post
end
