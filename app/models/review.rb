class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  scope :order_by_created_at, ->{order created_at: :desc}
end
