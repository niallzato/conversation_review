class ChangeIntSize < ActiveRecord::Migration
  def change
    change_column :tags, :intercom_id, :integer, limit: 8
    change_column :conversations, :intercom_id, :integer, limit: 8
    change_column :conversation_parts, :intercom_id, :integer, limit: 8
  end
end
