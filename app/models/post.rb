# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: {maximum: 45}
  validates :content, presence: true
  belongs_to :user, required: false
  has_many :comments
end
