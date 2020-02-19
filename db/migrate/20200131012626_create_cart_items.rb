class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.belongs_to :product, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
