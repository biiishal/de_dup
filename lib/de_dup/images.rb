# frozen_string_literal: true

require 'digest/md5'
require 'fileutils'

module DeDup
  # Methods for image file types.
  module Images
    def self.process(zip_file)
      DeDup::Utils.unzip(zip_file)
      FileUtils.chdir('./tmp')
      DeDup::Utils.print_results(
        DeDup::Utils.md5_map(
          DeDup::Utils.img_entries
        )
      )
      Dir.chdir('../')
      FileUtils.rm_rf('tmp/.')
      'Done!'
    end
  end
end
