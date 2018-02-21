class RenameAvatarCacheColumnToPractices < ActiveRecord::Migration[5.1]
  def change
    rename_column :practices, :avatar_cache, :practice_photo_cache
  end
end
