require 'spec_helper'

describe "slide_types/edit.html.erb" do
  before(:each) do
    @slide_type = assign(:slide_type, stub_model(SlideType,
      :name => "MyString"
    ))
  end

  it "renders the edit slide_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slide_types_path(@slide_type), :method => "post" do
      assert_select "input#slide_type_name", :name => "slide_type[name]"
    end
  end
end
