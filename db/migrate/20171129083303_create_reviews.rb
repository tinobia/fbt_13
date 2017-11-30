class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true
      t.text :content

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
  end
end
