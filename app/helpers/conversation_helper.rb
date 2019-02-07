module ConversationHelper
  require 'pry'

  MIN_PARTS = 5

  def self.valid?(conversation)
    closed?(conversation) && ignoredTag?(conversation) && minLength?(conversation)
  end

  private

  def self.closed?(conversation)
    conversation.open == false
  end

  def self.ignoredTag?(conversation)
    conversation = singleConversation(conversation.id)
    conversation.tags.each do |tag|
      unless Tag.where(name: tag.name, ignore: true).empty?
        return false
      end
    end
    true
  end

  def self.minLength?(conversation)
    conversation.conversation_parts.count > MIN_PARTS
  end

  def self.singleConversation(id)
    intercom = Intercom::Client.new(token: ENV['intercom_token'])
    intercom.conversations.find(id: id)
  end

end
