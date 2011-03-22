require 'spec_helper'

describe "slides/edit.html.erb" do
  before(:each) do
    @slide = assign(:slide, stub_model(Slide,
      :content => "MyText",
      :slide_type => nil
    ))
  end

  it "renders the edit slide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slides_path(@slide), :method => "post" do
      assert_select "textarea#slide_content", :name => "slide[content]"
      assert_select "input#slide_slide_type", :name => "slide[slide_type]"
    end
  end
end
