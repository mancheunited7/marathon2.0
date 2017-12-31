class CreateCompetitionResults < ActiveRecord::Migration[5.1]
  def change
    create_table :competition_results do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.string :address, null: false, default: ""
      t.string :competition_place, null: false, default: ""
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :distance, null: false
      t.string :competition_name, null: false
      t.integer :hour
      t.integer :minute
      t.integer :second
      t.integer :calc_time, null: false
      t.integer :heart_rate
      t.text :content, null:false, default: ""
      t.string :avatar
      t.string :avatar_cache
      t.integer :competition_point, null: false
      t.text :competition_memo, null: false, default: ""

      t.timestamps
    end
  end
end
