class ConversationPart < ActiveRecord::Base
  belongs_to :conversation
  has_many :attachments

  validates_uniqueness_of :intercom_id

  validates :intercom_id, presence: true
  validates :conversation_id, presence: true

end
