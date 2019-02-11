class AddAdminIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :admin_id, :integer
  end
end
