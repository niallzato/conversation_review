class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|

      t.timestamps null: false
      t.integer :intercom_id, null: false
      t.boolean :reviewed, default: false
    end
  end
end
