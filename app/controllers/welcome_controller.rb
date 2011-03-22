class WelcomeController < ApplicationController
  
  def index
    if signed_in?
      @slideshows = Slideshow.all
    else
      @slideshows = Slideshow.where(:visible => true)
    end
  end

end
