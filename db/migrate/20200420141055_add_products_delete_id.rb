class AddProductsDeleteId < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delete_id, :integer
  end
end
