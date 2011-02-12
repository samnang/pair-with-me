require 'spec_helper'

describe UsersController, "GET 'show'"do
  let(:user) { Factory.create(:user) }

  before { get :show, :id => user.username}

  it { should respond_with(:success) }
  it { assigns[:user].should == user }

  # Wait until gem gets new release
  # it { should assign_to(:user).with(user) }
end
