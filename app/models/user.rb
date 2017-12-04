class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :rate_tours, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :tourdetails, dependent: :destroy
  has_secure_password
  validates :name_user, presence: true, length: {maximum: Settings.name_user.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email.maximum},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.password.minimum}
  VALID_TEL_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  validates :tel, presence: true, length: {maximum: Settings.tel.maximum},
    format: {with: VALID_TEL_REGEX}
  scope :user_sort, ->{order(created_at: :desc)}
end
