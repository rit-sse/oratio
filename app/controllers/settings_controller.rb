class SettingsController < ApplicationController
  before_filter :authorize!

  # GET /settings
  # GET /settings.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slides }
    end
  end

end
