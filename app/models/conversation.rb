class Conversation < ActiveRecord::Base
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)",
     sender_id,recipient_id, recipient_id, sender_id)
  end

  def target_user(current_user)
    if sender_id == current_user.id
      user = User.find(recipient_id)
      if user.organizer_flg == false
        Artist.find_by(user_id: user.id)
      else
        Organizer.find_by(user_id: user.id)
      end
    elsif recipient_id == current_user.id
      user = User.find(sender_id)
      if user.organizer_flg == false
        Artist.find_by(user_id: user.id)
      else
        Organizer.find_by(user_id: user.id)
      end
    end
  end
end
