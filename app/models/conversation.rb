class Conversation < ActiveRecord::Base
  has_many :conversation_parts
  has_many :tags
  belongs_to :admin

  validates :conversation_part_id, presence: true
  validates :intercom_id, presence: true

end
