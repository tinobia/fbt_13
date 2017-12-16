class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  scope :order_by_created_at, ->{order created_at: :desc}
end
