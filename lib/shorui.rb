require_relative "shorui/version"
require_relative "shorui/generator"
require 'rails'

module Shorui
  class Error < StandardError; end

  class Railtie < Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/shorui.rake', __FILE__)
    end
  end
end