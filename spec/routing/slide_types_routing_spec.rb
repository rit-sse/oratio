require "spec_helper"

describe SlideTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/slide_types" }.should route_to(:controller => "slide_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/slide_types/new" }.should route_to(:controller => "slide_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/slide_types/1" }.should route_to(:controller => "slide_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/slide_types/1/edit" }.should route_to(:controller => "slide_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/slide_types" }.should route_to(:controller => "slide_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/slide_types/1" }.should route_to(:controller => "slide_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/slide_types/1" }.should route_to(:controller => "slide_types", :action => "destroy", :id => "1")
    end

  end
end
