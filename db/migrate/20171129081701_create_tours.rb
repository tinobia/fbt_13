class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name_tour
      t.text :content
      t.datetime :starttime
      t.datetime :endtime
      t.integer :price
      t.boolean :is_empty_slot, default: true
      t.boolean :is_open, default: true
      t.string :picture
      t.references :category_tour, foreign_key: true

      t.timestamps
    end
    add_index :tours, :name_tour
    add_index :tours, :price
  end
end
