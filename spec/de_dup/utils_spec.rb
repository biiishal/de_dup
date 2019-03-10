# frozen_string_literal: true

RSpec.describe DeDup::Utils do
  describe '.unzip' do
    it 'unzips a .zip file to ./tmp directory'
  end

  describe '.img_entries' do
    it 'returns an array of all paths of image files in a directory'
  end

  describe '.md5_map' do
    it 'returns a map { md5_hash => [duplicate_file_paths] } given [file_paths]'
  end

  describe '.print_results' do
    it "prints values of a hash map if it's an array and has >1 element"
  end
end
