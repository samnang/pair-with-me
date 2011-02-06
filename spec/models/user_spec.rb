require 'spec_helper'

describe User do
  describe "validations" do
    subject { Factory.create(:user) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:username) }
    it { should allow_value("blah-1").for(:username) }
    it { should_not allow_value("-blah").for(:username) }
    it { should ensure_length_of(:username).is_at_most(20) }

    it { should validate_presence_of(:full_name) }
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
end