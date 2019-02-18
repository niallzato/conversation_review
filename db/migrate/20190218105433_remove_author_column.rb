class RemoveAuthorColumn < ActiveRecord::Migration
  def change
    remove_column :conversations, :author_id
    remove_column :conversations, :author_type
  end
end
