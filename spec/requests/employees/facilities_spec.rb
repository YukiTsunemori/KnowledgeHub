require 'rails_helper'

RSpec.describe "Facilities", type: :request do
  # FactoryBotのテストデータを使ってuserとpostのデータを作成
  let(:employee) { create(:employee) }

  describe "#new" do
    it "returns HTTP status 200" do
      sign_in employee
      get new_employees_facility_path
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    it "returns HTTP status 302" do
      sign_in employee
      facilities_params = FactoryBot.attributes_for(:facility)
      post employees_facilities_path, params: { facility: facilities_params }
      expect(response).to have_http_status(302)
    end
  end
end
