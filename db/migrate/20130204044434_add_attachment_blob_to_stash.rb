class AddAttachmentBlobToStash < ActiveRecord::Migration
  def self.up
    add_column :stashes, :blob_file_name, :string
    add_column :stashes, :blob_content_type, :string
    add_column :stashes, :blob_file_size, :integer
    add_column :stashes, :blob_updated_at, :datetime
  end

  def self.down
    remove_column :stashes, :blob_file_name
    remove_column :stashes, :blob_content_type
    remove_column :stashes, :blob_file_size
    remove_column :stashes, :blob_updated_at
  end
end
