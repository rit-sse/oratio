class SlideTypesController < ApplicationController
  # GET /slide_types
  # GET /slide_types.xml
  def index
    @slide_types = SlideType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slide_types }
    end
  end

  # GET /slide_types/1
  # GET /slide_types/1.xml
  def show
    @slide_type = SlideType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slide_type }
    end
  end

  # GET /slide_types/new
  # GET /slide_types/new.xml
  def new
    @slide_type = SlideType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slide_type }
    end
  end

  # GET /slide_types/1/edit
  def edit
    @slide_type = SlideType.find(params[:id])
  end

  # POST /slide_types
  # POST /slide_types.xml
  def create
    @slide_type = SlideType.new(params[:slide_type])

    respond_to do |format|
      if @slide_type.save
        format.html { redirect_to(@slide_type, :notice => 'Slide type was successfully created.') }
        format.xml  { render :xml => @slide_type, :status => :created, :location => @slide_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slide_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slide_types/1
  # PUT /slide_types/1.xml
  def update
    @slide_type = SlideType.find(params[:id])

    respond_to do |format|
      if @slide_type.update_attributes(params[:slide_type])
        format.html { redirect_to(@slide_type, :notice => 'Slide type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slide_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slide_types/1
  # DELETE /slide_types/1.xml
  def destroy
    @slide_type = SlideType.find(params[:id])
    @slide_type.destroy

    respond_to do |format|
      format.html { redirect_to(slide_types_url) }
      format.xml  { head :ok }
    end
  end
end
