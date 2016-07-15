class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :stash_id
      t.string :username
      t.string :email
      t.text :body
      t.integer :parent_id

      t.timestamps
    end
  end
end
