require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let!(:team) { Team.create!(name: "Bill's cats", manager_id: 2, season_id: 1) }

  describe "GET #new" do
    let(:league) {League.create!(name: "Busch League")}
    let(:season) {Season.create!(league_id: 1)}
    it "assigns a newly created team as @team" do

      get(:new, team: {name: 'THE LLAMAS', manager_id: 2, season_id: season.id})
      expect(assigns(:team)).to be_a_new(Team)
    end
  end

  describe "POST #create" do
    context "When valid params are passed" do
      it "creates a new team" do
        expect{
          post :create, team: {name: 'THE LLAMAS', manager_id: 2, season_id: 1}
        }.to change(Team, :count).by(1)
      end

      it "assigns a newly created a team as @team" do
        post(:create, team: {name: 'THE LLAMAS', manager_id: 2, season_id: 1})
        expect(assigns(:game)).to eq(Game.last)
      end

      it "redirects to the created game" do
        expect(post(:create, team: {name: 'THE LLAMAS', manager_id: 2, season_id: 1})).to redirect_to("/teams/#{assigns(:team).id}")
      end
    end

    context "when invalid params are passed" do
      it "assigns the newly created but unsaved as @game" do
        post(:create,  team: {name: 'THE LLAMAS'})
        expect(assigns(:team)).to be_a_new(Team)
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested team as @team" do
      get :show, { id: team.id }
      expect(assigns(:team)).to eq(team)
    end
  end
end
