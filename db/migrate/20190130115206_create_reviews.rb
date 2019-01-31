class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.timestamps null: false
      t.integer :conversation_id
      t.boolean :reviewed
      t.integer :tone
      t.integer :quality
      t.boolean :fip
      t.text :notes
    end
  end
end
