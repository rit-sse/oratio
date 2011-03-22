require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe SlideTypesController do

  def mock_slide_type(stubs={})
    @mock_slide_type ||= mock_model(SlideType, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all slide_types as @slide_types" do
      SlideType.stub(:all) { [mock_slide_type] }
      get :index
      assigns(:slide_types).should eq([mock_slide_type])
    end
  end

  describe "GET show" do
    it "assigns the requested slide_type as @slide_type" do
      SlideType.stub(:find).with("37") { mock_slide_type }
      get :show, :id => "37"
      assigns(:slide_type).should be(mock_slide_type)
    end
  end

  describe "GET new" do
    it "assigns a new slide_type as @slide_type" do
      SlideType.stub(:new) { mock_slide_type }
      get :new
      assigns(:slide_type).should be(mock_slide_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested slide_type as @slide_type" do
      SlideType.stub(:find).with("37") { mock_slide_type }
      get :edit, :id => "37"
      assigns(:slide_type).should be(mock_slide_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created slide_type as @slide_type" do
        SlideType.stub(:new).with({'these' => 'params'}) { mock_slide_type(:save => true) }
        post :create, :slide_type => {'these' => 'params'}
        assigns(:slide_type).should be(mock_slide_type)
      end

      it "redirects to the created slide_type" do
        SlideType.stub(:new) { mock_slide_type(:save => true) }
        post :create, :slide_type => {}
        response.should redirect_to(slide_type_url(mock_slide_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slide_type as @slide_type" do
        SlideType.stub(:new).with({'these' => 'params'}) { mock_slide_type(:save => false) }
        post :create, :slide_type => {'these' => 'params'}
        assigns(:slide_type).should be(mock_slide_type)
      end

      it "re-renders the 'new' template" do
        SlideType.stub(:new) { mock_slide_type(:save => false) }
        post :create, :slide_type => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested slide_type" do
        SlideType.stub(:find).with("37") { mock_slide_type }
        mock_slide_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :slide_type => {'these' => 'params'}
      end

      it "assigns the requested slide_type as @slide_type" do
        SlideType.stub(:find) { mock_slide_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:slide_type).should be(mock_slide_type)
      end

      it "redirects to the slide_type" do
        SlideType.stub(:find) { mock_slide_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(slide_type_url(mock_slide_type))
      end
    end

    describe "with invalid params" do
      it "assigns the slide_type as @slide_type" do
        SlideType.stub(:find) { mock_slide_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:slide_type).should be(mock_slide_type)
      end

      it "re-renders the 'edit' template" do
        SlideType.stub(:find) { mock_slide_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested slide_type" do
      SlideType.stub(:find).with("37") { mock_slide_type }
      mock_slide_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the slide_types list" do
      SlideType.stub(:find) { mock_slide_type }
      delete :destroy, :id => "1"
      response.should redirect_to(slide_types_url)
    end
  end

end