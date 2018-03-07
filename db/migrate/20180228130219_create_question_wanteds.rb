class CreateQuestionWanteds < ActiveRecord::Migration[5.1]
  def change
    create_table :question_wanteds do |t|
      t.string :big_category
      t.string :small_category
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :state
      t.integer :comment
      t.integer :stock

      t.timestamps
    end
  end
end
