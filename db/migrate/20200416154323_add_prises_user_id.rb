class AddPrisesUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :user_id, :integer
  end
end
