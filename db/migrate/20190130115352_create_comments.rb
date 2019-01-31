class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps null: false
      t.integer :review_id, null: false
      t.text :body, null: false

    end
  end
end
