class Comment < ActiveRecord::Base
  belongs_to :review

  validates :review_id, presence: true
  validates :body, presence: true

end
