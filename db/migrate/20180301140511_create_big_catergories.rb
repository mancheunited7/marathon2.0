class CreateBigCatergories < ActiveRecord::Migration[5.1]
  def change
    create_table :big_catergories do |t|
      t.string :category

      t.timestamps
    end
  end
end
