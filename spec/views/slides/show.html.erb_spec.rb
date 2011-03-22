require 'spec_helper'

describe "slides/show.html.erb" do
  before(:each) do
    @slide = assign(:slide, stub_model(Slide,
      :content => "MyText",
      :slide_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
