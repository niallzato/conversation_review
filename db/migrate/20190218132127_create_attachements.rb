class CreateAttachements < ActiveRecord::Migration
  def change
    create_table :attachments do |t|

      t.timestamps null: false
      t.integer :part_id, null: false, limit: 8
      t.text :type
      t.text :content_type
      t.text :name
      t.text :url
      t.integer :filesize, null: false, limit: 8

      t.index [:part_id, :url], unique: true
    end
  end
end
