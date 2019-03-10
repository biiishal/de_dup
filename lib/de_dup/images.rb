# frozen_string_literal: true

require 'digest/md5'

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
      FileUtils.rm_rf('.')
      'Done!'
    end
  end
end
