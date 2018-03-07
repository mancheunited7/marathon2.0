class AddBigCategoryIdToQuestionWanteds < ActiveRecord::Migration[5.1]
  def change
    add_column :question_wanteds, :big_catergories_id, :integer
    add_column :question_wanteds, :small_catergories_id, :integer
  end
end
