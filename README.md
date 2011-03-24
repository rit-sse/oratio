# Oratio
A web-based, AJAXy presentation software created for [RIT's](http://rit.edu) 
[Society of Software Engineers](http://sse.se.rit.edu).

## Authors
Cody Krieger ([https://github.com/codykrieger](https://github.com/codykrieger))  
Brian To ([https://github.com/brianto](https://github.com/brianto))

## Oratio's Purpose
To provide a slick, minimal replacement to the SSE's current PowerPoint 
presentation, and the old calendar on the whiteboard.

## Setup
    git clone git://github.com/codykrieger/oratio.git
    cd oratio
    rvm use default@oratio --create # if using rvm (which you should be)
    bundle install
    rake db:migrate && rake db:seed

All done!
