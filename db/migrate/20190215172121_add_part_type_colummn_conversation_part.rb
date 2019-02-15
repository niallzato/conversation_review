class AddPartTypeColummnConversationPart < ActiveRecord::Migration
  def change
    add_column :conversation_parts, :part_type, :string
  end
end
