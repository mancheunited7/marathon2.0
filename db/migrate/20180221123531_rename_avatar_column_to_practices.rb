class RenameAvatarColumnToPractices < ActiveRecord::Migration[5.1]
  def change
    rename_column :practices, :avatar, :practice_photo
  end
end
