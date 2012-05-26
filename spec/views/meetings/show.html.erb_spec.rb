require 'spec_helper'

describe "meetings/show" do
  before(:each) do
    @meeting = assign(:meeting, stub_model(Meeting,
      :entry_id => 1,
      :participants => "Participants",
      :perpose => "Perpose",
      :location => "Location",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Participants/)
    rendered.should match(/Perpose/)
    rendered.should match(/Location/)
    rendered.should match(/MyText/)
  end
end
