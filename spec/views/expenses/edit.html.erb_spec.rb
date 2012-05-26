require 'spec_helper'

describe "expenses/edit" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :travel_expense_report_id => 1,
      :classification => "MyString",
      :amount => 1,
      :pay_method_id => 1,
      :note => "MyString"
    ))
  end

  it "renders the edit expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path(@expense), :method => "post" do
      assert_select "input#expense_travel_expense_report_id", :name => "expense[travel_expense_report_id]"
      assert_select "input#expense_classification", :name => "expense[classification]"
      assert_select "input#expense_amount", :name => "expense[amount]"
      assert_select "input#expense_pay_method_id", :name => "expense[pay_method_id]"
      assert_select "input#expense_note", :name => "expense[note]"
    end
  end
end
