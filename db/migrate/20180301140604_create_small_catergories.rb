class CreateSmallCatergories < ActiveRecord::Migration[5.1]
  def change
    create_table :small_catergories do |t|
      t.string :category
      t.integer :big_catergory_id

      t.timestamps
    end
  end
end
