class Comment < ApplicationRecord
  belong_to :review
  belong_to :user
end
