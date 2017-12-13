class Tour < ApplicationRecord
  belongs_to :category_tour
  mount_uploader :picture, PictureUploader
  has_many :rate_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tourdetails, dependent: :destroy

  validates :name_tour, presence: true
  validates :content, presence: true

  scope :show_tour, ->{order "id DESC"}
  scope :search_all, ->(name_tour, category_tour_id) do
    where "name_tour LIKE ? AND category_tour_id = ?", "%#{name_tour}%", category_tour_id
  end
end
