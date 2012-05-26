require 'spec_helper'

describe "expenses/index" do
  before(:each) do
    assign(:expenses, [
      stub_model(Expense,
        :travel_expense_report_id => 1,
        :classification => "Classification",
        :amount => 2,
        :pay_method_id => 3,
        :note => "Note"
      ),
      stub_model(Expense,
        :travel_expense_report_id => 1,
        :classification => "Classification",
        :amount => 2,
        :pay_method_id => 3,
        :note => "Note"
      )
    ])
  end

  it "renders a list of expenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
