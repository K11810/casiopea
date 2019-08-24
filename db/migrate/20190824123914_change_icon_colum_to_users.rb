class ChangeIconColumToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :icon, nil
    change_column :users, :icon, :text, null: true
  end
end
