require 'spec_helper'

describe User do
  describe "validations" do
    subject { Factory(:user) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
    it { should allow_value("blah-1").for(:username) }
    it { should_not allow_value("-blah").for(:username) }
    it { should ensure_length_of(:username).is_at_most(20) }

    it { should ensure_length_of(:full_name).is_at_most(30) }

    it { should validate_uniqueness_of(:email) }
    it { should_not allow_value("blah").for(:email) }
    it { should_not allow_value("b lah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
    it { should allow_value("asdf@asdf.com").for(:email) }

    it { should_not allow_value("bl-ah").for(:twitter_id) }
    it { should_not allow_value("b lah").for(:twitter_id) }
    it { should allow_value("blash_1").for(:twitter_id) }
    it { should ensure_length_of(:twitter_id).is_at_most(15) }

    it { should allow_value("bl-ah").for(:github_id) }
    it { should_not allow_value("-blah").for(:github_id) }
    it { should allow_value("blah-1").for(:github_id) }
    it { should ensure_length_of(:github_id).is_at_most(40) }
  end

  describe "associations" do
    it { should have_many(:request_to) }
    it { should have_many(:receive_from) }
  end


  describe '#avatar_url' do
    let(:user) { Factory(:user, :email => "samnang.chhun@gmail.com") }
    
    def expected_gravatar_url(size = User::DEFAULT_SIZE_AVATAR)
      "http://gravatar.com/avatar/863e24c91fcf1cd3c879ea62a401365e.png?d=mm&s=#{size}"
    end

    it "should return gravatar url with default size" do
      user.avatar_url.should == expected_gravatar_url
    end

    it "should return gravatar url with custom size" do
      size = 256

      user.avatar_url(size).should == expected_gravatar_url(size)
    end
  end
end
