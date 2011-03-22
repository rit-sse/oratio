require 'spec_helper'

describe "slideshows/show.html.erb" do
  before(:each) do
    @slideshow = assign(:slideshow, stub_model(Slideshow,
      :name => "Name",
      :description => "Description",
      :visible => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
