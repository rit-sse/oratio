require 'spec_helper'

describe "slideshows/edit.html.erb" do
  before(:each) do
    @slideshow = assign(:slideshow, stub_model(Slideshow,
      :name => "MyString",
      :description => "MyString",
      :visible => false
    ))
  end

  it "renders the edit slideshow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slideshows_path(@slideshow), :method => "post" do
      assert_select "input#slideshow_name", :name => "slideshow[name]"
      assert_select "input#slideshow_description", :name => "slideshow[description]"
      assert_select "input#slideshow_visible", :name => "slideshow[visible]"
    end
  end
end
