class CreateConversationParts < ActiveRecord::Migration
  def change
    create_table :conversation_parts do |t|

      t.timestamps null: false
      t.integer :conversation_id, null: false
      t.integer :intercom_id, null: false
      t.text :body

    end
  end
end
