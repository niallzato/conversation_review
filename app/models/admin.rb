class Admin < ActiveRecord::Base
  has_many :conversations
  has_many :reviews

  validates_uniqueness_of :intercom_id

  validates :name, presence: true
  validates :email, presence: true
  validates :intercom_id, presence: true

end
