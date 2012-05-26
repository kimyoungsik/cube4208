require 'spec_helper'

describe "business_trip_reports/index" do
  before(:each) do
    assign(:business_trip_reports, [
      stub_model(BusinessTripReport,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :interview => "Interview",
        :interviewee => "Interviewee",
        :content => "MyText",
        :result => "MyText"
      ),
      stub_model(BusinessTripReport,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :interview => "Interview",
        :interviewee => "Interviewee",
        :content => "MyText",
        :result => "MyText"
      )
    ])
  end

  it "renders a list of business_trip_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Participants".to_s, :count => 2
    assert_select "tr>td", :text => "Perpose".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Interview".to_s, :count => 2
    assert_select "tr>td", :text => "Interviewee".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
