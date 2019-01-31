class Admin < ActiveRecord::Base
  has_many :conversations
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true
  validates :intercom_id, presence: true

end
