class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.integer :delete_id
      t.integer :admin_id
      t.integer :count

      t.timestamps
    end
  end
end
