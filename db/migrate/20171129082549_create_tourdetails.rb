class CreateTourdetails < ActiveRecord::Migration[5.1]
  def change
    create_table :tourdetails do |t|
      t.references :tour, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :num_of_pass
      t.integer :total_price
      t.timestamps
    end
  end
end
