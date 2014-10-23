class Shout < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic: true

  has_many :likes

  validates :content_id, presence: true

  def username
    user.username
  end
end
