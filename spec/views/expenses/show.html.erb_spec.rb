require 'spec_helper'

describe "expenses/show" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :travel_expense_report_id => 1,
      :classification => "Classification",
      :amount => 2,
      :pay_method_id => 3,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Classification/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Note/)
  end
end
