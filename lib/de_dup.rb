# frozen_string_literal: true

%w[version utils images].each do |file|
  require_relative "./de_dup/#{file}.rb"
end

# A simple library to list out paths to duplicate images in a directory.
module DeDup
  # Your code goes here...
end
