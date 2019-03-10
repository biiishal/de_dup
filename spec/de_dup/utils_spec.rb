# frozen_string_literal: true

RSpec.describe DeDup::Utils do
  describe '.unzip' do
    it 'returns a message if provided file is not a .zip file' do
      expect(DeDup::Utils.unzip('anything.txt')).to eq('Please input a .zip file.')
    end

    it 'unzips a .zip file to ./tmp directory' do
      Dir.chdir('spec/fixtures/test_images')
      expected_entries = Dir.glob('**/*')
      Dir.chdir('../../../')
      DeDup::Utils.unzip('spec/fixtures/test_images.zip')
      expect((Dir.entries('.').include? 'tmp')).to be_truthy
      Dir.chdir('tmp')
      expect(Dir.glob('**/*')).to eq(expected_entries)
      FileUtils.rm_rf('.')
    end
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
