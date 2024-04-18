class CreateScreens < ActiveRecord::Migration[7.1]
  def change
    create_table :screens do |t|
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
