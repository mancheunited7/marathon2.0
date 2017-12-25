class CreatePractices < ActiveRecord::Migration[5.1]
  def change
    create_table :practices do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.integer :distance, null: false
      t.integer :hour, null: false
      t.integer :minute, null: false
      t.integer :second, null: false
      t.text :content,null: false
      t.integer :weight
      t.integer :heart_rate
      t.string :avatar
      t.string :avatar_cache

      t.timestamps
    end
  end
end
