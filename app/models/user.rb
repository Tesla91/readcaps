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


end
