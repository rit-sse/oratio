class SlidesController < ApplicationController
  before_filter :get_slideshow, :authorize!
  
  # GET /slides
  # GET /slides.xml
  def index
    @slides = @slideshow.slides

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  # GET /slides/1
  # GET /slides/1.xml
  def show
    @slide = Slide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slide }
    end
  end

  # GET /slides/new
  # GET /slides/new.xml
  def new
    @slide = Slide.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slide }
    end
  end

  # GET /slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # POST /slides
  # POST /slides.xml
  def create
    @slide = Slide.new(params[:slide])
    @slide.slideshow = @slideshow

    respond_to do |format|
      if @slide.save
        format.html { redirect_to(slideshow_slides_path, :notice => 'Slide was successfully created.') }
        format.xml  { render :xml => [@slideshow, @slide], :status => :created, :location => @slide }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slides/1
  # PUT /slides/1.xml
  def update
    @slide = Slide.find(params[:id])

    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        format.html { redirect_to(slideshow_slides_path, :notice => 'Slide was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slide.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.xml
  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to(slideshow_slides_path, :notice => 'Slide was successfully destroyed.') }
      format.xml  { head :ok }
    end
  end
  
protected
  
  def get_slideshow
    @slideshow = Slideshow.find_by_id(params[:slideshow_id])
  end
end
