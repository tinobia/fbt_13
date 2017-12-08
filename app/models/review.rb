class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  has_many :like_reviews, dependent: :destroy

  validates :user_id, presence: true
  validates :tour_id, presence: true
  validates :content, presence: true

  scope :show_review_related, ->(tour_id) do
    where "tour_id = ? ", tour_id
  end
  scope :show_review_yourself, ->(user_id) do
    where "user_id = ?", user_id
  end
  scope :order_by_updated_at, ->{order "updated_at DESC"}
end
