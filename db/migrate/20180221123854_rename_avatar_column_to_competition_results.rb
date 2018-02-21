class RenameAvatarColumnToCompetitionResults < ActiveRecord::Migration[5.1]
  def change
    rename_column :competition_results, :avatar, :competition_result_photo
    rename_column :competition_results, :avatar_cache, :competition_result_photo_cache
  end
end
