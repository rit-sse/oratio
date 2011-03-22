require 'spec_helper'

describe "slide_types/index.html.erb" do
  before(:each) do
    assign(:slide_types, [
      stub_model(SlideType,
        :name => "Name"
      ),
      stub_model(SlideType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of slide_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
