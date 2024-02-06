require 'rails_helper'
require 'faker'

RSpec.describe "Users API", type: :request do
  describe 'GET /users' do
    before do
      user1 = {
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name
      }
      FactoryBot.create(:user, first_name: user1[:first_name] last_name: user1[:last_name], email: Faker::Internet.safe_email(name: "#{user1[:first_name} #{user1[:last_name]}"))
      FactoryBot.create(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.safe_email)
      FactoryBot.create(
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
        post "/api/v1/users", params: { user: { first_name: "Susan", last_name: "Wakoma" } }
      }.to change { User.count }.from(0).to(1)

      expect(response).to have_http_status(:created)

      expect(JSON.parse(response.body)["first_name"]).to eq("Susan")
      expect(JSON.parse(response.body)["last_name"]).to eq("Wakoma")
    end
  end

  describe "DELETE /users/:id" do
    let!(:user) { FactoryBot.create(:user, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) }

    it "deletes a user" do
      expect {
        delete "/api/v1/users/#{user.id}"
      }.to change { User.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end
