class AddUserIdToScreens < ActiveRecord::Migration[7.1]
  def change
    add_column :screens, :user_id, :integer
    add_index :screens, :user_id
  end
end
