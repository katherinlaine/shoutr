class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :shouts

  has_many :followee_relationships,
    class_name: "FollowRelationship",
    foreign_key: "follower_id"

  has_many :followees, through: :followee_relationships

  has_many :follower_relationships,
    class_name: "FollowRelationship",
    foreign_key: "followee_id"

  has_many :followers, through: :follower_relationships

  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  def to_param
    username
  end

  def timeline
    Shout.where(user_id: timeline_author_ids).order(created_at: :desc)
  end

  private

  def timeline_author_ids
    [id] + followee_ids
  end
end
