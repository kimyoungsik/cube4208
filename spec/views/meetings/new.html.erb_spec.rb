require 'spec_helper'

describe "meetings/new" do
  before(:each) do
    assign(:meeting, stub_model(Meeting,
      :entry_id => 1,
      :participants => "MyString",
      :perpose => "MyString",
      :location => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new meeting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meetings_path, :method => "post" do
      assert_select "input#meeting_entry_id", :name => "meeting[entry_id]"
      assert_select "input#meeting_participants", :name => "meeting[participants]"
      assert_select "input#meeting_perpose", :name => "meeting[perpose]"
      assert_select "input#meeting_location", :name => "meeting[location]"
      assert_select "textarea#meeting_content", :name => "meeting[content]"
    end
  end
end
