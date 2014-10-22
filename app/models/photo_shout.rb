class PhotoShout < ActiveRecord::Base
  validates :url, presence: true
end
