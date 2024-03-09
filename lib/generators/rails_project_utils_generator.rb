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

        unless gem_installed?('brakeman')
          say 'brakeman is not installed. Adding to Gemfile...'
          add_to_gemfile('brakeman')
        end

        unless gem_installed?('rubycritic')
          say 'rubycritic is not installed. Adding to Gemfile...'
          add_to_gemfile('rubycritic')
        end

        unless gem_installed?('bundler-audit')
          say 'bundler-audit is not installed. Adding to Gemfile...'
          add_to_gemfile('bundler-audit')
        end

        create_env_file
        say 'Installing dependencies...'
        system('bundle install')
      end

      private

      def create_env_file
        filename = '.rails_project_utils.env'
        options = {}

        # Default options (can be customized)
        default_options = {
          variables: {
            'COMPOSE_PROJECT_NAME' => File.basename(Dir.pwd),
            '# DOCKER_COMPOSE_PATH' => 'path-do-docker-compose.yaml'
          },
          overwrite: false  # Prevent accidental overwriting by default
        }

        # Merge user options with defaults
        options = default_options.merge(options)

        # Validate filename and create directory if needed
        FileUtils.mkdir_p(File.dirname(filename)) unless Dir.exist?(File.dirname(filename))

        # Create the file, handle potential overwrite
        if File.exist?(filename) && !options[:overwrite]
          raise "Error: File '#{filename}' already exists. Use :overwrite => true to proceed."
        end

        File.open(filename, 'w') do |file|
          options[:variables].each do |key, value|
            file.puts("#{key}=#{value}")  # Write each environment variable on a new line
          end
        end

        puts "Environment file '#{filename}' created successfully."
      end


      def gem_installed?(gem_name)
        `bundle show #{gem_name}`
        $?.success?
      end

      def add_to_gemfile(gem_name)
        gem gem_name, require: false
      end
    end
  end
end
