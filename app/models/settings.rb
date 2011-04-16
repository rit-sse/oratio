require 'yaml'

class Settings
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :default_timeout

  validates_numericality_of :default_timeout

  def save()
    filedump = File.open("config/settings.yml", 'w')
    YAML::dump( self, filedump )
    filedump.close()
  end

  def to_yaml_properties
    # Only saves relevant data; not the errors, for example
    %w(@default_timeout)
  end

  def persisted?
    false
  end

  def update(settings)
    @default_timeout = settings['default_timeout']
    if valid?
      @default_timeout = Integer(@default_timeout)
      save()
      true
    else
      false
    end
  end

  def Settings.load()
    YAML::load( File.open("config/settings.yml") )
  end

end
