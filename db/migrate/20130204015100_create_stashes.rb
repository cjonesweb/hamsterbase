class CreateStashes < ActiveRecord::Migration
  def change
    create_table :stashes do |t|
      t.string :title
      t.text :body
      t.text :url
      t.integer :parent_id

      t.timestamps
    end
  end
end
