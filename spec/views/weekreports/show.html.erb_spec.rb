require 'spec_helper'

describe "weekreports/show" do
  before(:each) do
    @weekreport = assign(:weekreport, stub_model(Weekreport,
      :team_id => 1,
      :participants => "Participants",
      :location => "Location",
      :goal => "Goal",
      :contents => "MyText",
      :result => "Result"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Participants/)
    rendered.should match(/Location/)
    rendered.should match(/Goal/)
    rendered.should match(/MyText/)
    rendered.should match(/Result/)
  end
end
