# frozen_string_literal: true

require 'digest/md5'
require 'fileutils'

module DeDup
  # Methods for image file types.
  module Images
    def self.process(zip_file)
      initial_path = Dir.pwd
      file_dir = File.dirname(zip_file)
      basename = File.basename(zip_file)

      FileUtils.mkdir_p("#{file_dir}/#{basename}_tmp")
      FileUtils.chdir(file_dir)
      DeDup::Utils.unzip(basename)
      FileUtils.chdir("./#{basename}_tmp")
      DeDup::Utils.print_results(
        DeDup::Utils.md5_map(
          DeDup::Utils.img_entries
        )
      )
      Dir.chdir('../')
      FileUtils.rm_rf("./#{basename}_tmp")
      Dir.chdir(initial_path)
      'Done!'
    end
  end
end
