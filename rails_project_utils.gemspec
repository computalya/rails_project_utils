# frozen_string_literal: true

# rails_project_utils.gemspec

require_relative "lib/rails_project_utils/version"

Gem::Specification.new do |spec|
  spec.name = "rails_project_utils"
  spec.version = RailsProjectUtils::VERSION
  spec.authors = ["Atilla Gündüz"]
  spec.email = ["gunduz.atilla@icloud.com"]

  spec.summary = "Collection of scripts to simplify setup, testing, and quality checks for Ruby on Rails projects."
  spec.homepage = "https://github.com/computalya/rails_project_utils"
  spec.description = "A set of scripts accessible through `bin/run` command for Ruby on Rails projects."
  spec.license = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/computalya/rails_project_utils"
  spec.metadata["changelog_uri"] = "https://github.com/computalya/rails_project_utils/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .gitlab-ci.yml appveyor Gemfile])
    end
  end

  # spec.metadata["allowed_push_host"] = "https://rubygems.org"
end
