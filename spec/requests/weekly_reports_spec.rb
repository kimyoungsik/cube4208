require 'spec_helper'

describe "WeeklyReports" do
  describe "GET /weekly_reports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get weekly_reports_path
      response.status.should be(200)
    end
  end
end
