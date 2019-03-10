# frozen_string_literal: true

RSpec.describe DeDup::Images do
  describe '.de_dup' do
    let(:expected_output) do
      "Duplicate images:

test_images/test_images/folder_1/The night sky.jpg
test_images/test_images/folder_2/The night sky_2.jpg

====================

test_images/test_images/folder_1/staring contest.jpg
test_images/test_images/folder_2/staring contest_2.jpg
test_images/test_images/folder_3/staring contest_3.jpg

====================

test_images/test_images/folder_1/sweet boat.jpg
test_images/test_images/folder_2/sweet boat_2.jpg

====================

"
    end

    it 'outputs paths to duplicate files in a .zip directory' do
      expect do
        DeDup::Images.process('spec/fixtures/test_images.zip')
      end.to output(expected_output).to_stdout
    end
  end
end
