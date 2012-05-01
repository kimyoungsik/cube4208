# require 'spec_helper'
# 
# describe "weekly_reports/index" do
#   before(:each) do
#     assign(:weekly_reports, [
#       stub_model(WeeklyReport,
#         :team_id => 1,
#         :participants => "Participants",
#         :location => "Location",
#         :goal => "Goal",
#         :content => "MyText",
#         :result => "Result"
#       ),
#       stub_model(WeeklyReport,
#         :team_id => 1,
#         :participants => "Participants",
#         :location => "Location",
#         :goal => "Goal",
#         :content => "MyText",
#         :result => "Result"
#       )
#     ])
#   end
# 
#   it "renders a list of weekly_reports" do
#     render
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "tr>td", :text => 1.to_s, :count => 2
#     assert_select "tr>td", :text => "Participants".to_s, :count => 2
#     assert_select "tr>td", :text => "Location".to_s, :count => 2
#     assert_select "tr>td", :text => "Goal".to_s, :count => 2
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => "Result".to_s, :count => 2
#   end
# end
