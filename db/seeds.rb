# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
intercom = Intercom::Client.new(token: ENV['intercom_token'])


#populate attachements
def populate_attachments(attachments, part_id)
  attachments.each do |attachment|
    Attachment.create_with(url: attachment.url, name: attachment.name, type: attachment.type, content_type: attachment.contnet_type, part_id: part_id)
  end
end


# populate admins
intercom.admins.all.each do |admin|
  Admin.create_with(name: admin.name, email: admin.email).find_or_create_by(intercom_id: admin.id)
end

# populate tags
intercom.tags.all.each do |tag|
  Tag.create_with(name: tag.name).find_or_create_by(intercom_id: tag.id)
end

# populate conversations
count = 0
intercom.conversations.all.each do |conv|
  conv = ConversationHelper.singleConversation(conv.id)
  if ConversationHelper.valid?(conv)
    db_conv = Conversation.create_with(admin_id: conv.assignee.id).find_or_create_by(intercom_id: conv.id)
    part = ConversationPart.create_with(conversation_id: db_conv.id, body: conv.conversation_message.body, author_id: conv.conversation_message.author.id, author_type: conv.conversation_message.author.type, part_type: conv.conversation_message.type ).find_or_create_by(intercom_id: conv.conversation_message.id)
    populate_attachments(conv.attachments, part.id)
    conv.conversation_parts.each do |part|
      c_part = ConversationPart.create_with(conversation_id: db_conv.id, body: part.body, author_id: part.author.id, author_type: part.author.type, part_type: part.part_type).find_or_create_by(intercom_id: part.id)
      populate_attachments(part.attachments, c_part.id)
    end
    count += 1
  end
  if count > 100
    break
  end
end

