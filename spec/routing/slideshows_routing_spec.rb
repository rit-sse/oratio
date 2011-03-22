require "spec_helper"

describe SlideshowsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/slideshows" }.should route_to(:controller => "slideshows", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/slideshows/new" }.should route_to(:controller => "slideshows", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/slideshows/1" }.should route_to(:controller => "slideshows", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/slideshows/1/edit" }.should route_to(:controller => "slideshows", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/slideshows" }.should route_to(:controller => "slideshows", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/slideshows/1" }.should route_to(:controller => "slideshows", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/slideshows/1" }.should route_to(:controller => "slideshows", :action => "destroy", :id => "1")
    end

  end
end
