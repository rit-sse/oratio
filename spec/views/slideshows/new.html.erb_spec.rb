require 'spec_helper'

describe "slideshows/new.html.erb" do
  before(:each) do
    assign(:slideshow, stub_model(Slideshow,
      :name => "MyString",
      :description => "MyString",
      :visible => false
    ).as_new_record)
  end

  it "renders new slideshow form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => slideshows_path, :method => "post" do
      assert_select "input#slideshow_name", :name => "slideshow[name]"
      assert_select "input#slideshow_description", :name => "slideshow[description]"
      assert_select "input#slideshow_visible", :name => "slideshow[visible]"
    end
  end
end
