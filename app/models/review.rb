class Review < ActiveRecord::Base
  has_many :comments
  belongs_to :admin
  belongs_to :conversation
end
