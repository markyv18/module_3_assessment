require 'rails_helper'

RSpec.describe "as a user" do
  it "when i visit the root page and i submit a zipcode search" do
    VCR.use_cassette("80202") do

      visit '/'

      fill_in 'zip', with: "80202"

      click_on 'Find Stores'
      expect(current_path).to eq(search_path)
      expect(current_path).to eq('/search')

      expect(page).to have_content("17 Total Stores within 25 miles of that zip")
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("3.45")
      expect(page).to have_content("DENVER")
      within("#store-list") do
        expect(page).to have_css('li', count: 50)
        expect(page).to have_css('/li', count: 50)
      end
    end
  end
end
