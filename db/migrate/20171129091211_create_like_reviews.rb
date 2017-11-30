class CreateLikeReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :like_reviews do |t|
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true
      t.boolean :is_like, default: false
      t.timestamps
    end
  end
end
