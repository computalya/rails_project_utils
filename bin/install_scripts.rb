#!/usr/bin/env ruby

# This script installs the custom scripts into a Ruby on Rails project

require 'fileutils'

# Define the source directory where the scripts are located
SCRIPTS_DIR = File.expand_path('../../scripts', __FILE__)

# Define the destination directory where the scripts will be copied
DEST_DIR = File.expand_path('../../bin', __FILE__)

# List of scripts to install
SCRIPTS_TO_INSTALL = ['ci', 'cleanup', 'dockerdown', 'dockerup', 'qualitycheck', 'server', 'setup']
SPECIAL_SCRIPTS = ['run']

# Confirm with the user before proceeding
puts "This script will install the custom scripts into your Rails project."
print "Continue? (y/n): "
confirmation = gets.chomp.downcase
exit unless confirmation == 'y'

# Install each script
(SCRIPTS_TO_INSTALL + SPECIAL_SCRIPTS).each do |script|
  source_file = File.join(SCRIPTS_DIR, script)
  dest_file = script == 'run' ? File.join(DEST_DIR, script) : File.join(DEST_DIR, 'scripts', script)

  # Copy the script file
  FileUtils.cp(source_file, dest_file)

  # Add executable permissions
  FileUtils.chmod('+x', dest_file)

  puts "Installed #{script} script."
end

puts "All scripts installed successfully!"
