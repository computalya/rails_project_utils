# lib/generators/rails_project_utils/uninstall_generator.rb

require 'rails/generators'
require 'fileutils'

module RailsProjectUtils
  module Generators
    class UninstallGenerator < Rails::Generators::Base
      def uninstall_rails_project_utils
        say 'Removing run script from bin folder...'
        destination_run = Rails.root.join('bin', 'run')
        FileUtils.rm(destination_run) if File.exist?(destination_run)

        say 'Removing scripts folder from bin/scripts...'
        destination_scripts = Rails.root.join('bin', 'scripts')
        FileUtils.rm_rf(destination_scripts) if File.exist?(destination_scripts)

        say 'Removing gems from Gemfile...'
        remove_from_gemfile('brakeman')
        remove_from_gemfile('rubycritic')

        say 'Removing dependencies...'
        system('bundle install')

        say 'Uninstallation complete.'
      end

      private

      def remove_from_gemfile(gem_name)
        # gsub_file 'Gemfile', /^gem '#{gem_name}'\n/, ''
        say 'rubycritic and brakeman was installed for ruby_project_utils. Use "bundle remove <gem name>" to uninstall'
      end
    end
  end
end
