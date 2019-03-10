# frozen_string_literal: true

module DeDup
  # Common utility methods useful for different file types.
  module Utils
    def self.unzip(zip_file)
      return 'Please input a .zip file.' unless File.extname(zip_file) == '.zip'
      %x(`unzip #{zip_file} -d tmp/`)
    end
  end
end
