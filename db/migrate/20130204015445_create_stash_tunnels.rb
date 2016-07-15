class CreateStashTunnels < ActiveRecord::Migration
  def change
    create_table :stash_tunnels do |t|
      t.integer :stash_id
      t.integer :network_stash_id
      t.text :comment

      t.timestamps
    end
  end
end
