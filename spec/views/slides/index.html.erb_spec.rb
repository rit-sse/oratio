require 'spec_helper'

describe "slides/index.html.erb" do
  before(:each) do
    assign(:slides, [
      stub_model(Slide,
        :content => "MyText",
        :slide_type => nil
      ),
      stub_model(Slide,
        :content => "MyText",
        :slide_type => nil
      )
    ])
  end

  it "renders a list of slides" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
