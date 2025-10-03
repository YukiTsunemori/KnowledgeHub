require "rails_helper"

RSpec.describe "room_category", type: :system do
  describe "ルームカテゴリー新規登録の画面" do
    let(:employee) { create(:employee) }
    before do
      sign_in employee, scope: :employee
      visit new_employees_room_category_path
    end

    context "入力フォームに文字列が入っているとき" do
      let(:room_category) { build(:room_category) }
      it "新規作成が無事できること" do
        expect(page).to have_content("ルームカテゴリ新規作成")
        fill_in "カテゴリーネーム", with: room_category.name
        click_button "追加"
        expect(page).to have_content("ルームカテゴリー「#{room_category.name}」は無事作成されました。")
      end
    end
      
    context "入力フォームが空の時" do
      it "エラーメッセージを確認すること" do
        fill_in "カテゴリーネーム", with: ""
        click_button "追加"
        expect(page).to have_content("カテゴリを入力してください")
      end
    end

    context "すでに同じ名前が登録されている時" do
      let(:room_category) { create(:room_category) }
      it "エラーメッセージを確認すること" do
        fill_in "カテゴリーネーム", with: room_category.name
        click_button "追加"
        expect(page).to have_content("カテゴリはすでに存在します")
      end
    end
  end
end
