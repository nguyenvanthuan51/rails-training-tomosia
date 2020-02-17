class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { maximum: 255 }

  private

  def not_referenced_by_any_cart_item
    if cart_items.present?
      errors.add(:base, "Cart items present")
      throw :abort
    end
  end
end
