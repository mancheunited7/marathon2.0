class AddToPractice < ActiveRecord::Migration[5.1]
  def change
    add_column :practices, :weather, :string
    add_column :practices, :temperature, :integer
    add_column :practices, :humidity, :integer
    add_column :practices, :wind_speed, :integer
    add_column :practices, :lap, :integer
    add_column :practices, :body_fat, :integer
  end
end
