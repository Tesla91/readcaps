class Book < ApplicationRecord
  has_many :recaps, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
