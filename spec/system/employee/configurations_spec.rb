require "rails_helper"

RSpec.describe 'configuraion', type: :system do
  describe 'リンクボタン一覧画面' do
    let(:employee) { create(:employee) }
    before do
      sign_in employee, scope: :employee
      visit employees_root_path
    end
    it 'ヘッダーが表示されること' do
      expect(page).to have_content("Knowledge Hub")
    end

    it "ルームカテゴリーボタンが存在し、リンクが正しいこと" do
      expect(page).to have_link("ルームカテゴリー設定", href: employee_room_categories_path)
    end

    it "アメニティーグループボタンが存在し、リンクが正しいこと" do
      expect(page).to have_content("アメニティー")
      expect(page).to have_link("アメニティー設定", href: employee_amenity_groups_path)
    end

    it "ルームリストボタンが存在し、リンクが正しいこと" do
      expect(page).to have_content("ルームリスト")
      expect(page).to have_link("ルームリスト設定", href: employee_room_lists_path)
    end
  end
end
