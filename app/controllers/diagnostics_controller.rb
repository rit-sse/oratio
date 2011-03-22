class DiagnosticsController < ApplicationController
  before_filter :authorize!
  
  def index
  end
  
  def test_flash_notice
    redirect_to diagnostics_path, :notice => "Testing notice!"
  end
  
  def test_flash_alert
    redirect_to diagnostics_path, :alert => "Testing alert!"
  end

end
