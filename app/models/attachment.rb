class Attachment < ActiveRecord::Base
  belongs_to :conversation_part

  validates :url, presence: true
  validates :part_id, presence: true
  validates :type, presence: true
  validates :content_type, presence: true
  validates :name, presence: true

end
