class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.datetime :created_at
      t.boolean :completed_at
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
