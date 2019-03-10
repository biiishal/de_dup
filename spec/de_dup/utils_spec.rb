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
      Dir.chdir('../../../')
    end
  end

  describe '.md5_map' do
    it 'returns a map { md5_hash => [duplicate_file_paths] } given [file_paths]' do
      expected_result = {
        'a39aeb2e62c5f4ffd9a485913fc15b20' => ['test_images/test_images/folder_1/The night sky.jpg', 'test_images/test_images/folder_2/The night sky_2.jpg'],
        '472844f6f2a10019fdc18c9f4158f37b' => ['test_images/test_images/folder_1/staring contest.jpg', 'test_images/test_images/folder_2/staring contest_2.jpg', 'test_images/test_images/folder_3/staring contest_3.jpg'],
        '0a0c4a48c521fa72864977d1677ecaee' => ['test_images/test_images/folder_1/sweet boat.jpg', 'test_images/test_images/folder_2/sweet boat_2.jpg'],
        'a5751acf7c7af17ceae4baa615dfc14d' => ['test_images/test_images/folder_3/water taxis.jpg']
      }
      Dir.chdir('spec/fixtures/expected_extract')
      img_entries = DeDup::Utils.img_entries.sort
      expect(DeDup::Utils.md5_map(img_entries)).to eq(expected_result)
    end
  end

  describe '.print_results' do
    it "prints values of a hash map if it's an array and has >1 element"
  end
end
