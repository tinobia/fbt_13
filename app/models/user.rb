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

  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attributes remember_digest: nil
  end

  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def activate
    update_columns activated: true, activated_at: Time.zone.now
  end
end
