require 'spec_helper'

describe ApplicationHelper do
  describe '#.avatar_url' do
    let(:email) { "samnang.chhun@gmail.com" }
    
    def expected_gravatar_url(size = ApplicationHelper::DEFAULT_SIZE_AVATAR)
      "http://gravatar.com/avatar/863e24c91fcf1cd3c879ea62a401365e.png?s=#{size}"
    end

    it "should return gravatar url with default size" do

      helper.avatar_url(email).should == expected_gravatar_url
    end

    it "should return gravatar url with custom size" do
      size = 256

      helper.avatar_url(email, size).should == expected_gravatar_url(size)
    end
  end
end
