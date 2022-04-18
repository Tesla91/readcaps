class Book < ApplicationRecord
  before_create :set_default_description
  has_many :recaps, dependent: :destroy

  validates :title, presence: true
  # validates :author, presence: true

  include PgSearch::Model

  multisearchable against: %i[title author]

  pg_search_scope :search_by_title_and_author,
                  against: %i[title author],
                  using: {
                    tsearch: { prefix: true }
                  }

  private

  def set_default_description
    self.description = "No description given" if description.nil?
  end
end
