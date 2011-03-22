require "spec_helper"

describe SlidesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/slides" }.should route_to(:controller => "slides", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/slides/new" }.should route_to(:controller => "slides", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/slides/1" }.should route_to(:controller => "slides", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/slides/1/edit" }.should route_to(:controller => "slides", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/slides" }.should route_to(:controller => "slides", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/slides/1" }.should route_to(:controller => "slides", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/slides/1" }.should route_to(:controller => "slides", :action => "destroy", :id => "1")
    end

  end
end
