require "rails_helper"

RSpec.describe Facility, type: :model do
  let(:facility) { create(:facility) }
  describe "バリデーション" do
    it "正しい文字列の時は有効であること" do
      expect(facility).to be_valid
    end

    it "空の文字列は無効であること" do
      facility.name = ""
      expect(facility).to be_invalid
    end

    it "時間の入力にもじれつは入らないことを確認する" do
      facility.open_time = "営業時間"
      expect(facility).to be_invalid
    end
  end
end
