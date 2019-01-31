class Review < ActiveRecord::Base
  has_many :comments
  belongs_to :admin

end
