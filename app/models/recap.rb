class Recap < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :ratings

  validates :summary, presence: true, length: { minimum: 50 }
  validates :user, uniqueness: { scope: :book }
end
