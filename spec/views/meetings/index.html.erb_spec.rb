require 'spec_helper'

describe "meetings/index" do
  before(:each) do
    assign(:meetings, [
      stub_model(Meeting,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :content => "MyText"
      ),
      stub_model(Meeting,
        :entry_id => 1,
        :participants => "Participants",
        :perpose => "Perpose",
        :location => "Location",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Participants".to_s, :count => 2
    assert_select "tr>td", :text => "Perpose".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
