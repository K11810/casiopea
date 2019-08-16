class ChangeColumToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, false, "default_user"
    change_column_null :users, :icon, false, "default_icon"
  end
end
