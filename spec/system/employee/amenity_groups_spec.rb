require "rails_helper"

RSpec.describe "amenity_group", type: :system do
  describe "アメニティーグループの新規登録の画面" do
    let(:employee) { create(:employee) }
    before do
      sign_in employee, scope: :employee
      visit new_employees_amenity_group_path
    end

    context "入力フォームに文字列が入っている時" do
      let(:amenity_group) { build(:amenity_group) }
      it "新規作成が無事できること" do
        fill_in "グループネーム", with: amenity_group.name
        fill_in "内容", with: amenity_group.content
        click_button "追加"
        expect(page).to have_content("アメニティーグループ「#{amenity_group.name}」は無事作成されました。")
      end
    end

    context "入力フォームが空文字列の時" do
      it "エラーメッセージが表示されること" do
        fill_in "グループネーム", with: ""
        click_button "追加"
        expect(page).to have_content("アメニティグループを入力してください")
        expect(page).to have_content("内容を入力してください")
      end
    end
  end
end
