class CreateRateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :rate_tours do |t|
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
