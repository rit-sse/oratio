class WelcomeController < ApplicationController
  
  def index
    @slideshows = Slideshow.all
  end

end
