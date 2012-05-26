require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :entry_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path, :method => "post" do
      assert_select "input#photo_entry_id", :name => "photo[entry_id]"
      assert_select "input#photo_name", :name => "photo[name]"
    end
  end
end
