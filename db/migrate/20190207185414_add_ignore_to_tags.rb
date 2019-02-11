class AddIgnoreToTags < ActiveRecord::Migration
  def change
    add_column :tags, :ignore, :boolean
  end
end
