require 'spec_helper'

describe PairRequestsController do
  login_user

  describe "GET 'index'" do
    before { get :index }

    it { should respond_with(:success) }
    it { assigns[:receive_from].should_not be_nil }
    it { assigns[:request_to].should_not be_nil }
    it { assigns[:pair_sessions].should_not be_nil }
  end

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

  describe "PUT 'update'" do

    context "different user try to update" do
      let(:pair_request) { Factory(:pair_request) }

      before { put :update, :id => pair_request.id, :status => 'Accepted' }

      it { should respond_with(:forbidden) }
    end

    context "sender try to accept" do
      let(:pair_request) { Factory(:pair_request, :sender => user) }

      before { put :update, :id => pair_request.id, :status => 'Accepted' }

      it { should respond_with(:forbidden) }
    end

    context "parter accept" do
      let(:pair_request) { Factory(:pair_request, :partner => user) }

      before { put :update, :id => pair_request.id, :status => 'Accepted' }

      it { should respond_with(:success) }
    end


    context "parter reject" do
      let(:pair_request) { Factory(:pair_request, :partner => user) }

      before { put :update, :id => pair_request.id, :status => 'Rejected' }

      it { should respond_with(:success) }
    end
  end
end
