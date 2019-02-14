class AddAuthorToPart < ActiveRecord::Migration
  def change
    add_column :conversations, :author_id, :integer, limit: 8
    add_column :conversations, :author_type, :string
    add_column :conversation_parts, :author_id, :integer, limit: 8
    add_column :conversation_parts, :author_type, :string
  end
end
