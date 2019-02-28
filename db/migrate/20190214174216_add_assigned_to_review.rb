class AddAssignedToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :assigned, :integer
  end
end
