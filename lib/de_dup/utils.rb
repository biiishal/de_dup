# frozen_string_literal: true

require 'digest/md5'

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

    # Returns a hash map with generated MD5 hash of a file as key and
    # an array of the image file path along with it's duplicates if present as value.
    # { 'a39aeb2e62c5f4ffd9a485913fc15b20' => ['file/path/img1.jpg', 'file/path/img2.jpg'],
    #   'dsn23b2e62c5f4ffd9a485913fc15b20' => ['file/path/to/another/img.jpg'] }
    def self.md5_map(entries)
      md5_map = {}
      entries.each do |entry|
        code = Digest::MD5.file(entry).to_s
        md5_map[code] = (md5_map[code] || []) << entry
      end
      md5_map
    end

    # Given {'key' => ['value1', 'value2',..] } prints values if more than one
    # are present.
    def self.print_results(map)
      puts "Duplicate images:\n\n"
      map.values.each do |el|
        puts el.join("\n") + "\n\n====================\n\n" if el.length > 1
      end
    end
  end
end
