# lib/generators/rails_project_utils_generator.rb

require 'rails/generators'
require 'bundler/cli'

module RailsProjectUtils
  module Generators
    class RailsProjectUtilsGenerator < Rails::Generators::Base
      def install_rails_project_utils
        say 'Installing rails_project_utils gem...'
        Bundler::CLI.start(['gem', 'install', 'rails_project_utils', '--no-document'])

        say 'Running install_script.rb...'
        system('ruby exe/install_script.rb')
      end
    end
  end
end
