class Recap < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :summary, presence: true, length: { minimum: 50 }
  # validates :user, uniqueness: { scope: :book }
  validates :title, presence: true , length: { maximum: 20 }
end
