require 'rails_helper'

RSpec.describe "as a user" do
  it "when i visit the root page and i submit a zipcode search" do
      visit '/'

      fill_in 'zip', with: "80202"

      click_on 'Find Stores'
      expect(current_path).to eq('/search')

      # And I should see stores within 25 miles of 80202
      # And I should see a message that says "16 Total Stores"
      # And I should see exactly 10 results
      # And I should see the long name, city, distance, phone number and store type for each of the 10 results

      expect(page).to have_content("16")
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("3.45")
      expect(page).to have_content("DENVER")
    end
end
