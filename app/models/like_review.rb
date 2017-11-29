class LikeReview < ApplicationRecord
  belong_to :review
  belong_to :user
end
