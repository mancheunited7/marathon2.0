class CreateRunFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :run_friends do |t|

      t.integer :follow_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :run_friends, :follow_id
    add_index :run_friends, :followed_id
    add_index :run_friends, [:follow_id, :followed_id], unique: true
  end
end
