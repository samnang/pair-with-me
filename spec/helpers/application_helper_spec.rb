require 'spec_helper'

describe ApplicationHelper do

  describe '#topic_tags' do
    it "should generate links for each tag" do
      expected_result = '<a href="/people?topic=Ruby" class="topic-tag">Ruby</a><a href="/people?topic=Rails" class="topic-tag">Rails</a>'

      helper.topic_tags("Ruby, Rails").should == expected_result
    end
  end
end
