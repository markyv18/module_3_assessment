require 'rails_helper'

RSpec.describe "a user can " do

  it "can GET items" do

    items = create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_success
    expect(response.status).to eq(200)

    response_items = JSON.parse(response.body, symbolize_name: true)

    expect(response_items.count).to eq(5)
    expect(response_items.first[:id]).to eq(items.first.id)
    expect(response_items.first[:name]).to eq(items.first.name)
    expect(response_items.first[:description]).to eq(items.first.description)
    expect(response_items.first[:image_url]).to eq(items.first.image_url)

    # When I send a GET request to /api/v1/items
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, image_url
    # but not the created_at or updated_at
  end

  it "can GET an item" do
  #   When I send a GET request to /api/v1/items/1
  #   I receive a 200 JSON response containing the id, name, description, image_url
  #   but not the created_at or updated_at
  end

  it "can DELETE an item" do
    # When I send a DELETE request to /api/v1/items/1
    # I receive a 204 JSON response if the record is successfully deleted
  end

  it "can POST/CREATE an item" do
    # When I send a POST request to /api/v1/items with a name, description, and image_url
    # I receive a 201 JSON response if the record is successfully created And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end
end
