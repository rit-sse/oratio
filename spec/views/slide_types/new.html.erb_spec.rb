require 'spec_helper'

describe "slide_types/new.html.erb" do
  before(:each) do
    assign(:slide_type, stub_model(SlideType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new slide_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slide_types_path, :method => "post" do
      assert_select "input#slide_type_name", :name => "slide_type[name]"
    end
  end
end
