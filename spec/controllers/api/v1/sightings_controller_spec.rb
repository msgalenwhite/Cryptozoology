require 'rails_helper'

RSpec.describe Api::V1::SightingsController, type: :controller do

  let!(:first_sighting) { FactoryBot.create(:sighting) }
  let!(:second_sighting) { FactoryBot.create(:sighting) }
  let!(:third_sighting) { FactoryBot.create(:sighting)}
  let!(:member1) { FactoryBot.create(:user)}
  let!(:member2) { FactoryBot.create(:user)}
  let!(:vote1) { UserVote.create(sighting: first_sighting, user: member1, vote: 1) }
  let!(:vote2) { UserVote.create(sighting: second_sighting, user: member1, vote: 1) }
  let!(:vote3) { UserVote.create(sighting: first_sighting, user: member2, vote: 1) }

  describe "GET#index" do
    it "should return a list of sightings with the most recent sighting first" do
      get :index
      returned_json = JSON.parse(response.body)["sightings"]

      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 3

      expect(returned_json[0]["id"]).to eq(first_sighting.id)
      expect(returned_json[0]["user_name"]).to eq(first_sighting.user.name)
      expect(returned_json[0]["cryptid_name"]).to eq(first_sighting.cryptid.name)
      expect(returned_json[0]["description"]).to eq(first_sighting.description)
      expect(returned_json[0]["location"]).to eq(first_sighting.location)
      expect(returned_json[0]["rating"]).to eq(first_sighting.rating)
      expect(returned_json[0]["vote_total"]).to eq 2
      expect(returned_json[0]["user_vote"]).to eq 0

      expect(returned_json[1]["id"]).to eq(second_sighting.id)
      expect(returned_json[1]["user_name"]).to eq(second_sighting.user.name)
      expect(returned_json[1]["cryptid_name"]).to eq(second_sighting.cryptid.name)
      expect(returned_json[1]["description"]).to eq(second_sighting.description)
      expect(returned_json[1]["location"]).to eq(second_sighting.location)
      expect(returned_json[1]["rating"]).to eq(second_sighting.rating)
      expect(returned_json[1]["vote_total"]).to eq 1
      expect(returned_json[1]["user_vote"]).to eq 0

      expect(returned_json[2]["id"]).to eq(third_sighting.id)
      expect(returned_json[2]["user_name"]).to eq(third_sighting.user.name)
      expect(returned_json[2]["cryptid_name"]).to eq(third_sighting.cryptid.name)
      expect(returned_json[2]["description"]).to eq(third_sighting.description)
      expect(returned_json[2]["location"]).to eq(third_sighting.location)
      expect(returned_json[2]["rating"]).to eq(third_sighting.rating)
      expect(returned_json[2]["vote_total"]).to eq 0
      expect(returned_json[2]["user_vote"]).to eq 0
    end
  end
end
