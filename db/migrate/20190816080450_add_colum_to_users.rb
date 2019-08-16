class AddColumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 50
    add_column :users, :icon, :text, limit: 255
  end
end
