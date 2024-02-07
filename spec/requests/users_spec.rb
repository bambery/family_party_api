require 'rails_helper'
require 'faker'

RSpec.describe "Users API", type: :request do
  describe 'GET /users' do
    before do
      create_pair(:user)
    end

    it "returns all users" do
      get "/api/v1/users"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /users' do
    it 'create a new user' do
      expect {
        post "/api/v1/users", params: { user: { first_name: "Susan", last_name: "Wakoma", email: "susanwakoma@test.com" } }
      }.to change { User.count }.from(0).to(1)

      expect(response).to have_http_status(:created)

      expect(JSON.parse(response.body)["first_name"]).to eq("Susan")
      expect(JSON.parse(response.body)["last_name"]).to eq("Wakoma")
      expect(JSON.parse(response.body)["email"]).to eq("susanwakoma@test.com")
    end
  end

  describe "DELETE /users/:id" do
    let!(:user) { create(:user) }

    it "deletes a user" do
      expect {
        delete "/api/v1/users/#{user.id}"
      }.to change { User.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
