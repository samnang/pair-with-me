class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_FORMAT = GITHUB_FORMAT = {
    :with        => /^(?!-)[a-z\d-]+/i,
    :message     => "can only contain alphanumeric characters and dashes.
                     Cannot start with a dash",
    :allow_blank => true
  }

  TWITTER_FORMAT = {
    :with        => /^\w+$/,
    :message     => "can only contain letters, numbers or underscores.",
    :allow_blank => true
  }

  validates :twitter_id, :length => { :maximum => 15 },
                                   :format => TWITTER_FORMAT
  validates :github_id,  :length => { :maximum => 40 },
                                   :format => GITHUB_FORMAT

  validates :username,  :uniqueness => true, :presence => true, 
                        :length => { :maximum => 20 }, :format => USER_FORMAT
  validates :full_name, :length => { :maximum => 30 }


  attr_accessor :login
  
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me,
                  :full_name, :time_zone, :website, :twitter_id, :github_id, :availability

  before_create :set_full_name

  def to_param
    username
  end

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

  private
  
  def set_full_name
    self.full_name = self.username
  end
end
