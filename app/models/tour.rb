class Tour < ApplicationRecord
  belongs_to :category_tour
  mount_uploader :picture, PictureUploader
  has_many :rate_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tourdetails, dependent: :destroy

  validates :name_tour, presence: true
  validates :content, presence: true
end
