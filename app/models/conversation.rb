class Conversation < ActiveRecord::Base
  has_many :conversation_parts
  has_many :tags
  belongs_to :admin

  validates :intercom_id, presence: true
  validates :admin_id, presence: true

end
