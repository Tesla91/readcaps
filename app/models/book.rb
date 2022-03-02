class Book < ApplicationRecord
  has_many :recaps, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true

  include PgSearch::Model

  multisearchable against: [:title, :author]

  pg_search_scope :search_by_title_and_author,
  against: [ :title, :author ],
  using: {
    tsearch: { prefix: true }
  }
end
