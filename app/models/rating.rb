class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recap

  validates :star, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  validates :user_id, :uniqueness => { :scope => :recap_id, :message => "You can only write one review p. recap." }
end
