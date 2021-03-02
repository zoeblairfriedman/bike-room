class CreateBikes < ActiveRecord::Migration[4.2]
  def change
    create_table :bikes do |t|
      t.string :model
      t.string :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
