class Tag < ActiveRecord::Base
  has_many :conversations

  validates_uniqueness_of :intercom_id


end
