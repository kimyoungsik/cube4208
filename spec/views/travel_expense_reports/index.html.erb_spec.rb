require 'spec_helper'

describe "travel_expense_reports/index" do
  before(:each) do
    assign(:travel_expense_reports, [
      stub_model(TravelExpenseReport,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :note => "MyText"
      ),
      stub_model(TravelExpenseReport,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of travel_expense_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Participants".to_s, :count => 2
    assert_select "tr>td", :text => "Perpose".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
