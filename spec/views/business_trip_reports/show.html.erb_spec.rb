require 'spec_helper'

describe "business_trip_reports/show" do
  before(:each) do
    @business_trip_report = assign(:business_trip_report, stub_model(BusinessTripReport,
      :entry_id => 1,
      :participants => "Participants",
      :perpose => "Perpose",
      :location => "Location",
      :interview => "Interview",
      :interviewee => "Interviewee",
      :content => "MyText",
      :result => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Participants/)
    rendered.should match(/Perpose/)
    rendered.should match(/Location/)
    rendered.should match(/Interview/)
    rendered.should match(/Interviewee/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
