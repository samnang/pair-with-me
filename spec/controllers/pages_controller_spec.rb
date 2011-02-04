require 'spec_helper'

describe PagesController do

  describe "GET 'katas'" do
    it "should be successful" do
      get 'example_katas'

      response.should be_success
    end
  end

end
