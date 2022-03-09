class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recaps
  has_many :favorites
  has_many :ratings
  has_one_attached :avatar

  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..20 }
  validates :username, presence: true, length: { in: 3..10 }

  def has_already_rated?(recap)
    ratings.pluck(:recap_id).include?(recap.id)
  end

  def has_already_recaped?(book)
    recaps.pluck(:book_id).include?(book.id)
  end

  def avg_received_ratings
    all_ratings = []
    recaps.each do |recap|
      all_ratings << recap.ratings.pluck(:star) unless recap.ratings.pluck(:star).empty?
    end
    if all_ratings.empty?
      return 0
    else
      all_ratings.flatten!.sum / all_ratings.size.to_f
    end
  end
end
