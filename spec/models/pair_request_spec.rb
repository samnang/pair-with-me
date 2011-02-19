require 'spec_helper'

describe PairRequest do
  context "validations" do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:pair_date) }
  end

  context "associations" do
    it { should belong_to(:partner) }
    it { should belong_to(:sender) }
  end
end
