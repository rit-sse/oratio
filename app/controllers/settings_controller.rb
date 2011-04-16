class SettingsController < ApplicationController
  before_filter :authorize!

  # GET /settings/edit
  # GET /settings/edit.xml
  def edit
    @users ||= AllowedUsers.all
    @setting ||= Settings.load

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @setting }
    end
  end

  # PUT /settings
  # PUT /settings.xml
  def update
    @setting ||= Settings.load()

    respond_to do |format|
      if @setting.update(params[:settings])
        format.html { redirect_to(edit_setting_path, :notice => 'Settings were successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
