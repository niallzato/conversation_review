class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.string :email, null: false
      t.integer :intercom_id, null: false

    end
  end
end
