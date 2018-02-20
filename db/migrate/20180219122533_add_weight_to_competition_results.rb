class AddWeightToCompetitionResults < ActiveRecord::Migration[5.1]
  def change
    add_column :competition_results, :weight, :integer
  end
end
