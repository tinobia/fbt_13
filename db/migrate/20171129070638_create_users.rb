class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name_user
      t.string :email
      t.string :tel
      t.string :password_digest
      t.boolean :gender
      t.string :address
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
