require 'spec_helper'

describe "travel_expense_reports/new" do
  before(:each) do
    assign(:travel_expense_report, stub_model(TravelExpenseReport,
      :entry_id => 1,
      :participants => "MyString",
      :perpose => "MyString",
      :location => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new travel_expense_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => travel_expense_reports_path, :method => "post" do
      assert_select "input#travel_expense_report_entry_id", :name => "travel_expense_report[entry_id]"
      assert_select "input#travel_expense_report_participants", :name => "travel_expense_report[participants]"
      assert_select "input#travel_expense_report_perpose", :name => "travel_expense_report[perpose]"
      assert_select "input#travel_expense_report_location", :name => "travel_expense_report[location]"
      assert_select "textarea#travel_expense_report_note", :name => "travel_expense_report[note]"
    end
  end
end
