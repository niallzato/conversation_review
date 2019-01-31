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

# populate conversations
count = 0
intercom.conversations.all.each do |convo|

end


