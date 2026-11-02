# frozen_string_literal: true

require "rake"

task default: %i[test]

task :test do
  sh "ruby -Ilib -Itest test/**/*_test.rb"
end
