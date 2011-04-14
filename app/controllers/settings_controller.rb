class SettingsController < ApplicationController
  before_filter :authorize!

  # GET /settings
  # GET /settings.xml
  def index
    @users ||= AllowedUsers.all
    @settings ||= Settings.load

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

  # POST /settings/edit
  # POST /settings/edit.xml
  def edit
    @settings ||= Settings.load()

    respond_to do |format|
      if @settings.update(params[:settings])
        format.html { redirect_to(:action => "index", :notice => 'Settings were successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @settings.errors, :status => :unprocessable_entity }
      end
    end
  end

end
