require 'spec_helper'

describe ApplicationHelper do
  describe '#.avatar_url' do
    let(:email) { "samnang.chhun@gmail.com" }
    
    def expected_gravatar_url(size = ApplicationHelper::DEFAULT_SIZE_AVATAR)
      "http://gravatar.com/avatar/863e24c91fcf1cd3c879ea62a401365e.png?d=mm&s=#{size}"
    end

    it "should return gravatar url with default size" do

      helper.avatar_url(email).should == expected_gravatar_url
    end

    it "should return gravatar url with custom size" do
      size = 256

      helper.avatar_url(email, size).should == expected_gravatar_url(size)
    end
  end

  describe '#topic_tags' do
    it "should generate links for each tag" do
      expected_result = '<a href="/people?topic=Ruby" class="topic-tag">Ruby</a><a href="/people?topic=Rails" class="topic-tag">Rails</a>'

      helper.topic_tags("Ruby, Rails").should == expected_result
    end
  end
end
