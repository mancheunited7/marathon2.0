class CreateCompetitionInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :competition_infos do |t|
      
      t.date :day
      t.string :name
      t.string :place
      t.string :site
      t.string :road
      t.string :trail

      t.timestamps
    end
  end
end
