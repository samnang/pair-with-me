require 'spec_helper'

describe UsersController do
  describe "GET 'show'" do
    let(:user) { Factory.create(:user) }

    before { get :show, :id => user.username}

    it { should respond_with(:success) }
    it { assigns[:user].should == user }

    # Wait until gem gets new release
    # it { should assign_to(:user).with(user) }
  end

  describe "PUT 'update'" do
    login_user

    before do 
      put :update, params
    end

    context "on the same logged in user" do
      let(:params) { {:id => user.username, :format => :json, :user => {:full_name => 'my name'}} }

      it { should respond_with(:success) }
      it { assigns[:user].full_name.should == params[:user][:full_name] }
    end

    context "different from logged in user" do
      let(:another_user) { Factory.create(:user, :username => 'another')}
      let(:params) { {:id => another_user.username, :format => :json, :user => {:full_name => 'my name'}} }

      it { should respond_with(:forbidden) }
    end
  end
end

