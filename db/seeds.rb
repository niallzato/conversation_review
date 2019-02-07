# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
intercom = Intercom::Client.new(token: ENV['intercom_token'])

# populate admins
intercom.admins.all.each do |admin|
  Admin.create(intercom_id: admin.id, name: admin.name, email: admin.email)
end

# populate tags
intercom.tags.all.each do |tag|
  Tag.create(intercom_id: tag.id, name: tag.name)
end


# populate conversations
count = 0
intercom.conversations.all.each do |conv|
  if ConversationHelper.valid?(conv)
    Conversation.create(intercom_id: conv.id, admin_id: conv.assignee.id)
    conv.conversation_parts.each do |part|
      ConversationPart.create(intercom_id: part.id, conversation_id: conv.id, body: part.body)
    end
    count += 1
    if count > 100
      break
    end
  end
end


