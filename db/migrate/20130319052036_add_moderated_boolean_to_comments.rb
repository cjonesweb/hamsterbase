class AddModeratedBooleanToComments < ActiveRecord::Migration
  def change
    add_column :comments, :moderated, :boolean
  end
end
