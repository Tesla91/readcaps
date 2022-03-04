class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recap

  validates :star, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
