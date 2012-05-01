# require 'spec_helper'
# 
# describe "weekly_reports/edit" do
#   before(:each) do
#     @weekly_report = assign(:weekly_report, stub_model(WeeklyReport,
#       :team_id => 1,
#       :participants => "MyString",
#       :location => "MyString",
#       :goal => "MyString",
#       :content => "MyText",
#       :result => "MyString"
#     ))
#   end
# 
#   it "renders the edit weekly_report form" do
#     render
# 
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "form", :action => weekly_reports_path(@weekly_report), :method => "post" do
#       assert_select "input#weekly_report_team_id", :name => "weekly_report[team_id]"
#       assert_select "input#weekly_report_participants", :name => "weekly_report[participants]"
#       assert_select "input#weekly_report_location", :name => "weekly_report[location]"
#       assert_select "input#weekly_report_goal", :name => "weekly_report[goal]"
#       assert_select "textarea#weekly_report_content", :name => "weekly_report[content]"
#       assert_select "input#weekly_report_result", :name => "weekly_report[result]"
#     end
#   end
# end
