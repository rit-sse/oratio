class AllowedUsersController < ApplicationController

  before_filter :authorize!

  # GET /allowed_users
  # GET /allowed_users.xml
  def index
    @users = AllowedUsers.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @users }
    end
  end

  # GET /allowed_users/new
  # GET /allowed_users/new.xml
  def new
    @user = AllowedUsers.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @user }
    end
  end

  # GET /allowed_users/1
  # GET /allowed_users/1.xml
  def show
    @user = AllowedUsers.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end

  # GET /allowed_users/1/edit
  def edit
    @user = AllowedUsers.find(params[:id])
  end

  # PUT /allowed_users/1
  # PUT /allowed_users/1.xml
  def update
    @user = AllowedUsers.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:allowed_users])
        format.html { redirect_to edit_setting_path, :notice => "User was successfully updated." }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = AllowedUsers.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to edit_setting_path, :notice => "User was successfully destroyed." }
      format.xml  { head :ok }
    end
  end

  # POST /allowed_users
  # POST /allowed_users.xml
  def create
    @user = AllowedUsers.new(params[:allowed_users])

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_setting_path, :notice => "User was successfully created." }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end











