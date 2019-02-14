class AddAssignedToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :assigned, :admin_id, :integer
  end
end
