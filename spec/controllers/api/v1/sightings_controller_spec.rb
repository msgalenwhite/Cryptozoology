require 'rails_helper'

RSpec.describe Api::V1::SightingsController, type: :controller do

  let!(:first_sighting) { FactoryBot.create(:sighting) }
  let!(:second_sighting) { FactoryBot.create(:sighting) }

  describe "GET#index" do
    it "should return a list of sightings with the most recent sighting first" do
      get :index
      returned_json = JSON.parse(response.body)["sightings"]

      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2

      expect(returned_json[0]["user_name"]).to eq(first_sighting.user.name)
      expect(returned_json[0]["cryptid_name"]).to eq(first_sighting.cryptid.name)
      expect(returned_json[0]["description"]).to eq(first_sighting.description)
      expect(returned_json[0]["location"]).to eq(first_sighting.location)
      expect(returned_json[0]["pic_url"]).to eq(first_sighting.pic_url)
      expect(returned_json[0]["rating"]).to eq(first_sighting.rating)
      expect(returned_json[0]["identified"]).to eq(first_sighting.identified)

      expect(returned_json[1]["user_name"]).to eq(second_sighting.user.name)
      expect(returned_json[1]["cryptid_name"]).to eq(second_sighting.cryptid.name)
      expect(returned_json[1]["description"]).to eq(second_sighting.description)
      expect(returned_json[1]["location"]).to eq(second_sighting.location)
      expect(returned_json[1]["pic_url"]).to eq(second_sighting.pic_url)
      expect(returned_json[1]["rating"]).to eq(second_sighting.rating)
      expect(returned_json[1]["identified"]).to eq(second_sighting.identified)

      expect(returned_json[0]["created_at"] < returned_json[1]["created_at"]).to eq true
    end
  end
end
