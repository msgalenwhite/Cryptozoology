require 'rails_helper'

RSpec.describe Api::V1::SightingsController, type: :controller do

  let!(:first_sighting) { FactoryBot.create(:sighting) }
  let!(:second_sighting) { FactoryBot.create(:sighting) }

  describe "GET#index" do
    it "should return a list of sightings with the most recent sighting first" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      expect(json.returned_json.length).to eq 2
      expect(returned_json[0]).to eq(first_sighting)
      expect(returned_json[1]).to eq(second_sighting)

      expect(returned_json[0].created_at).to < returned_json[1].created_at
    end
  end
end
