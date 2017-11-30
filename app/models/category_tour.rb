class CategoryTour < ApplicationRecord
  has_many :tours, dependent: :destroy
end
