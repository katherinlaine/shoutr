class Shout < ActiveRecord::Base
  belongs_to :user

  def username
    user.username
  end
end
