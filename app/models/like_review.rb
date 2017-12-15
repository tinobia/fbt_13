class LikeReview < ApplicationRecord
  belongs_to :review
  belongs_to :user

  scope :get_a_like, ->(review_id, user_id) do
    where "review_id = ? AND user_id = ? ", review_id, user_id
  end
end
