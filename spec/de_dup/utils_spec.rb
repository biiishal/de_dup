# frozen_string_literal: true

RSpec.describe DeDup::Utils do
  describe '.unzip' do
    it 'returns a message if provided file is not a .zip file' do
      expect(DeDup::Utils.unzip('anything.txt')).to eq('Please input a .zip file.')
    end

    it 'unzips a .zip file to ./tmp directory' do
      Dir.chdir('spec/fixtures/expected_extract')
      expected_entries = Dir.glob('**/*')
      Dir.chdir('../../../') # change dir to root
      DeDup::Utils.unzip('spec/fixtures/test_images.zip')
      expect((Dir.entries('.').include? 'tmp')).to be_truthy
      Dir.chdir('tmp')
      expect(Dir.glob('**/*')).to eq(expected_entries)
      FileUtils.rm_rf('.') # clean up
      Dir.chdir('../')
    end
  end

  describe '.img_entries' do
    it 'returns an array of all paths of only image files in current directory' do
      expected_entries = [
        'test_images/test_images/folder_1/staring contest.jpg',
        'test_images/test_images/folder_1/sweet boat.jpg',
        'test_images/test_images/folder_1/The night sky.jpg',
        'test_images/test_images/folder_2/sweet boat_2.jpg',
        'test_images/test_images/folder_2/The night sky_2.jpg',
        'test_images/test_images/folder_2/staring contest_2.jpg',
        'test_images/test_images/folder_3/water taxis.jpg',
        'test_images/test_images/folder_3/staring contest_3.jpg'
      ].sort
      Dir.chdir('spec/fixtures/expected_extract')
      expect(DeDup::Utils.img_entries.sort).to eq expected_entries
    end
  end

  describe '.md5_map' do
    it 'returns a map { md5_hash => [duplicate_file_paths] } given [file_paths]'
  end

  describe '.print_results' do
    it "prints values of a hash map if it's an array and has >1 element"
  end
end
