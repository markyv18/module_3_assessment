require 'rails_helper'

RSpec.describe "as a user" do
  context "when i visit the root page" do
    it "and i submit a zipcode search" do
      visit '/'


    end
  end
end

describe "when a user visits the root page" do
  it 'they fill in a zipcode in the search field and get a list of stores' do

    visit '/'

    within('#bs-example-navbar-collapse-1') do
      fill_in 'q', with: "80202"
      click_on 'Locate'
    end

    expect(current_path).to eq('/search')

    expect(page).to have_content("80202")
    expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(page).to have_content("303-252-8677")
    expect(page).to have_content("BEST BUY - AURORA")
  end
end

ENV["BB_API_KEY"]


As a user
When I visit "/"
And I fill in a search box with "80202" and click "search"
Then my current path should be "/search" (ignoring params)
And I should see stores within 25 miles of 80202
And I should see a message that says "16 Total Stores"
And I should see exactly 10 results
And I should see the long name, city, distance, phone number and store type for each of the 10 results
