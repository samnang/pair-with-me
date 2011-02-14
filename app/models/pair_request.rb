class PairRequest < ActiveRecord::Base
  belongs_to :sender,     :class_name => "User"
  belongs_to :partner,    :class_name => "User"
  
  validates :subject,     :presence => true
  validates :description, :presence => true
  validates :pair_date,   :presence => true
  validates :pair_time,   :presence => true
end
