require 'spec_helper'

describe "business_trip_reports/new" do
  before(:each) do
    assign(:business_trip_report, stub_model(BusinessTripReport,
      :entry_id => 1,
      :participants => "MyString",
      :perpose => "MyString",
      :location => "MyString",
      :interview => "MyString",
      :interviewee => "MyString",
      :content => "MyText",
      :result => "MyText"
    ).as_new_record)
  end

  it "renders new business_trip_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_trip_reports_path, :method => "post" do
      assert_select "input#business_trip_report_entry_id", :name => "business_trip_report[entry_id]"
      assert_select "input#business_trip_report_participants", :name => "business_trip_report[participants]"
      assert_select "input#business_trip_report_perpose", :name => "business_trip_report[perpose]"
      assert_select "input#business_trip_report_location", :name => "business_trip_report[location]"
      assert_select "input#business_trip_report_interview", :name => "business_trip_report[interview]"
      assert_select "input#business_trip_report_interviewee", :name => "business_trip_report[interviewee]"
      assert_select "textarea#business_trip_report_content", :name => "business_trip_report[content]"
      assert_select "textarea#business_trip_report_result", :name => "business_trip_report[result]"
    end
  end
end
