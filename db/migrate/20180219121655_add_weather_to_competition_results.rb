class AddWeatherToCompetitionResults < ActiveRecord::Migration[5.1]
  def change
    add_column :competition_results, :weather, :string
    add_column :competition_results, :temperature, :integer
    add_column :competition_results, :humidity, :integer
    add_column :competition_results, :wind_speed, :integer
    add_column :competition_results, :lap, :integer
    add_column :competition_results, :body_fat, :integer
  end
end
