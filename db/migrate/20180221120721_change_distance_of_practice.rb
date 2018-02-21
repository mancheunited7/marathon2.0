class ChangeDistanceOfPractice < ActiveRecord::Migration[5.1]
  def change
    change_column :practices, :distance, :numeric
    change_column :practices, :temperature, :numeric
    change_column :practices, :humidity, :numeric
    change_column :practices, :wind_speed, :numeric
    change_column :practices, :lap, :numeric
    change_column :practices, :body_fat, :numeric
    change_column :practices, :weight, :numeric
  end
end
