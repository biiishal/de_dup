# frozen_string_literal: true

module DeDup
  # Common utility methods useful for different file types.
  module Utils
    def self.unzip(zip_file)
      return 'Please input a .zip file.' unless File.extname(zip_file) == '.zip'
      %x(`unzip #{zip_file} -d tmp/`)
    end

    # Returns all the file paths with extensions .jpg, .JPG, .jpeg or .png
    # inside a directory
    def self.img_entries
      Dir.glob('**/*').select do |entry|
        %w[.jpg .JPG .jpeg .png].include?(File.extname(entry))
      end
    end
  end
end
