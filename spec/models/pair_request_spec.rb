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
    let(:sender) { Factory(:user) }
    let(:pair) { Factory(:pair_request, :sender => sender) }

    it "should return true when user is the sender of pair request" do
      pair.sent_from?(sender).should be_true
    end
  end

  describe "#received_by?(user)" do
    let(:partner) { Factory(:user) }
    let(:pair) { Factory(:pair_request, :partner => partner) }

    it "should return true when user is the receiver of pair request" do
      pair.received_by?(partner).should be_true
    end
  end

  describe "#pair_belongs_to?(user)" do
    let(:partner) { Factory(:user) }
    let(:sender) { Factory(:user) }
    let(:pair) { Factory(:pair_request, :sender => sender, :partner => partner) }

    it "should return true when user belongs to pair request" do
      pair.pair_belongs_to?(sender).should be_true
      pair.pair_belongs_to?(partner).should be_true
    end
  end
end
