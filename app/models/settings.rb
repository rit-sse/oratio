require 'yaml'

class Settings

  attr_accessor :def_timeout

  def initialize(path)
    @path = path

    @loadedYml = YAML::load( File.open(path) )

    puts @loadedYml['default_timeout']

    @def_timeout = Integer(@loadedYml.fetch('default_timeout'))
  end

  def save()
    filedump = File.open(@path, 'w')
    YAML::dump( @loadedYml, filedump )
    filedump.close()
  end

  def Settings.load()
    Settings.new("config/settings.yml")
  end

end
