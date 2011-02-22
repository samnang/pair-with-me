class PairRequest < ActiveRecord::Base
  belongs_to :sender,     :class_name => "User"
  belongs_to :partner,    :class_name => "User"
  
  validates :subject,     :presence => true
  validates :description, :presence => true
  validates :pair_date,   :presence => true

  scope :pair_sessions_of_user, lambda { |id| where("(sender_id = ? OR partner_id = ?) AND status = 'Accepted'", id, id) } 

  def update_status_by(user)
    return false unless pair_belongs_to?(user) and not user_try_to_accept_himself?(user)

    save
  end
  
  def pair_belongs_to?(user)
    sent_from?(user) || received_by?(user)
  end

  def sent_from?(user)
    sender == user
  end

  def received_by?(user)
    partner == user
  end

  private

  def user_try_to_accept_himself?(user)
    status == "Accepted" and sent_from?(user)
  end
end
