class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.integer :intercom_id, null: false
    end
  end
end
