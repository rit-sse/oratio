require 'yaml'

class Settings
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :default_timeout

  def save()
    filedump = File.open("config/settings.yml", 'w')
    YAML::dump( self, filedump )
    filedump.close()
  end

  def persisted?
    false
  end

  def update(settings)
    @default_timeout = Integer(settings['default_timeout'])

    save()

    true
  end

  def Settings.load()
    YAML::load( File.open("config/settings.yml") )
  end

end
