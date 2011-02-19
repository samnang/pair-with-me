require 'spec_helper'

describe PagesController do

  describe "GET 'katas'" do
    before { get :example_katas }

    it { should respond_with(:success) }
  end
end
