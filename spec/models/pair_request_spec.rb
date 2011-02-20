require 'spec_helper'

describe PairRequest do
  describe "validations" do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:pair_date) }
  end

  describe "associations" do
    it { should belong_to(:partner) }
    it { should belong_to(:sender) }
  end

  describe "#sent_from?(user)" do
    let(:sender) { Factory.create(:user) }
    let(:pair) { Factory.create(:pair_request, :sender => sender) }

    it "should return true when user is the sender of pair request" do
      pair.sent_from?(sender).should be_true
    end
  end
end
