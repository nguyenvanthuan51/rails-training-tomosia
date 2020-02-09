class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { maximum: 255 }

  def name
    # self[:name].upcase
    super
  end
end
