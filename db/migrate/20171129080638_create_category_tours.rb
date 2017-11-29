class CreateCategoryTours < ActiveRecord::Migration[5.1]
  def change
    create_table :category_tours do |t|
      t.string :name_category
      t.timestamps
    end
    add_index :category_tours, :name_category
  end
end
