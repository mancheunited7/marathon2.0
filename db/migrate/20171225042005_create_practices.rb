class CreatePractices < ActiveRecord::Migration[5.1]
  def change
    create_table :practices do |t|
      t.date :day
      t.integer :distance
      t.integer :hour
      t.integer :minute
      t.integer :second
      t.text :content
      t.integer :weight
      t.integer :heart_rate
      t.string :avatar
      t.string :avatar_cache

      t.timestamps
    end
  end
end
