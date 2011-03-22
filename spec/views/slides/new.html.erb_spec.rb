require 'spec_helper'

describe "slides/new.html.erb" do
  before(:each) do
    assign(:slide, stub_model(Slide,
      :content => "MyText",
      :slide_type => nil
    ).as_new_record)
  end

  it "renders new slide form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slides_path, :method => "post" do
      assert_select "textarea#slide_content", :name => "slide[content]"
      assert_select "input#slide_slide_type", :name => "slide[slide_type]"
    end
  end
end
