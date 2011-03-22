require 'spec_helper'

describe "slide_types/show.html.erb" do
  before(:each) do
    @slide_type = assign(:slide_type, stub_model(SlideType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
