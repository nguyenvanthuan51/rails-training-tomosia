class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :unpaid, -> { where(completed_at: false) }, class_name: Cart.name
  has_many :carts, -> { where completed_at: true }, dependent: :destroy
  has_one :cart_item, through: :unpaid
  has_many :cart_items, through: :carts
  has_many :paid_products, through: :cart_items, source: :product
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :encrypted_password, presence: true, length: { minimum: 6 }
end
