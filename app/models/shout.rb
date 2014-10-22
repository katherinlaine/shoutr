class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :content_id, presence: true

  def username
    user.username
  end
end
