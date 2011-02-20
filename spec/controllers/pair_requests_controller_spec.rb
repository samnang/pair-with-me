require 'spec_helper'

describe PairRequestsController do
  login_user

  describe "POST 'create'" do
    let(:partner) { Factory(:user, :username => 'samnang') }
    let(:pair_request_param) do 
      { 
        :subject => 'subject', 
        :description => "description",
        :pair_date => "18 Feb 2011 at 16:21 UTC",
        :partner_id => partner.id
      }
    end

    before do
      post :create, :pair_request => pair_request_param
    end

    it { should redirect_to(partner)  }
  end

  describe "GET 'index'" do
    before { get :index }

    it { should respond_with(:success) }
    it { assigns[:receive_from].should_not be_nil }
    it { assigns[:request_to].should_not be_nil }
    it { assigns[:pair_sessions].should_not be_nil }
  end
end
