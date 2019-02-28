class AddDateConversationPart < ActiveRecord::Migration
  def change
    add_column :conversation_parts, :timestamp, :integer, limit: 8
  end
end