class User < ApplicationRecord
  has_many :imageposts, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def feed
    Imagepost.where("user_id = ?", id)
  end
end
