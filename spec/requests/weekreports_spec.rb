require 'spec_helper'

describe "Weekreports" do
  describe "GET /weekreports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get weekreports_path
      response.status.should be(200)
    end
  end
end
