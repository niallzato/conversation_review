class ConversationPart < ActiveRecord::Base
  belongs_to :conversation

  validates :intercom__id, presence: true
  validates :conversation_id, presence: true

end
