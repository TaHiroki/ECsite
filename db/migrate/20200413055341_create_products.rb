class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_img
      t.integer :money
      t.text :description

      t.timestamps
    end
  end
end
