# frozen_string_literal: true

require 'yaml'
require 'singleton'

class ConfigAdapter
  include Singleton

  def load(file)
    YAML.load_file(file)
  end

  def save(file, object)
    File.open(file, 'w+') { |file| file.write object.to_yaml }
  end
end
