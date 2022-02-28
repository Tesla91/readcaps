class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recap

  validates :star, presence: true
  validates :comment, presence: true, length: { in: 10..200 }
end
