# frozen_string_literal: true

require_relative "rails_project_utils/version"

module RailsProjectUtils
  class Error < StandardError; end

  Gem.post_install do |installer|
    puts "My post-install message for #{installer.spec.name}"
  end
end
