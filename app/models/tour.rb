class Tour < ApplicationRecord
  belong_to :category_tour
  has_many :rate_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tourdetails, dependent: :destroy
end
