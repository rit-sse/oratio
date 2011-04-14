require 'yaml'

class Settings

  attr_accessor :default_timeout

  def save()
    filedump = File.open("config/settings.yml", 'w')
    YAML::dump( self, filedump )
    filedump.close()
  end

  def Settings.load()
    YAML::load( File.open("config/settings.yml") )
  end

end
