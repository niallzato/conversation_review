class AddDateColumnToPart < ActiveRecord::Migration
  def change
    add_column :conversation_parts, :created, :integer, limit: 8
  end
end
