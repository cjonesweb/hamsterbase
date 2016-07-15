class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :metadata do |t|
      t.integer :stash_id
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
