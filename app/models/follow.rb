class Follow < ActiveRecord::Base
  # belongs_to :follower, class_name: "User"
  # belongs_to :followed, class_name: "User"

  belongs_to :follower, class_name: "Artist"
  belongs_to :followed, class_name: "Artist"
end
