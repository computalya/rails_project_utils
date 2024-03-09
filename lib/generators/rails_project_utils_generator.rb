# lib/generators/rails_project_utils_generator.rb

require 'rails/generators'
require 'fileutils'

module RailsProjectUtils
  module Generators
    class RailsProjectUtilsGenerator < Rails::Generators::Base
      def install_rails_project_utils
        say 'Copying run script to bin folder...'
        source_run = File.expand_path('../templates/bin/run', __FILE__)
        destination_run = Rails.root.join('bin', 'run')
        FileUtils.cp(source_run, destination_run)
        FileUtils.chmod('+x', destination_run)

        say 'Copying scripts folder to bin/scripts...'
        source_scripts = File.expand_path('../templates/bin/scripts', __FILE__)
        destination_scripts = Rails.root.join('bin', 'scripts')
        FileUtils.cp_r(source_scripts, destination_scripts)

        say 'Setting executable permission for scripts...'
        Dir.glob(destination_scripts.join('*')).each do |script|
          FileUtils.chmod('+x', script)
        end
      end
    end
  end
end
