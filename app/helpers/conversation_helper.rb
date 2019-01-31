module ConversationHelper

  def valid?
    closed? && ignoredTag?
  end

  private

  def closed?
    conversation.open == false
  end

  def ignoredTag?
    conversation.tags.each do |tag|
      unless Tag.find(name: tag.name).empty?
        return false
      end
    end
    true
  end


end
