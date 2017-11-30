class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :rate_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tourdetails, dependent: :nullify
end
