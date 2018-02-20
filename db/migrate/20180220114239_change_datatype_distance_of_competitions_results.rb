class ChangeDatatypeDistanceOfCompetitionsResults < ActiveRecord::Migration[5.1]
  def change
    change_column :competition_results, :distance, :numeric
    change_column :competition_results, :temperature, :numeric
    change_column :competition_results, :humidity, :numeric
    change_column :competition_results, :wind_speed, :numeric
    change_column :competition_results, :lap, :numeric
    change_column :competition_results, :body_fat, :numeric
    change_column :competition_results, :weight, :numeric
  end
end
