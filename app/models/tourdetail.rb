class Tourdetail < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  validates :tour_id, presence: true
  validates :user_id, presence: true
  validates :num_of_pass, presence: true, format: {with: /\A\d+\z/}
  validates :total_price, presence: true, format: {with: /\A\d+\z/}
end
