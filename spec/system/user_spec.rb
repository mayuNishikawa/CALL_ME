require 'rails_helper'
RSpec.describe 'Posting in Lounge', type: :system do
  let!(:nickname_1){ FactoryBot.create(:nickname, content: "ぼっち", category: "prefix")}
  let!(:nickname_2){ FactoryBot.create(:nickname, content: "ジェイソン", category: "prefix")}
  let!(:nickname_3){ FactoryBot.create(:nickname, content: "たん", category: "suffix")}
  let!(:nickname_4){ FactoryBot.create(:nickname, content: "bot", category: "suffix")}
  let!(:nickname_5){ FactoryBot.create(:nickname, content: "バベル", category: "arbitrary_name")}
  let!(:nickname_6){ FactoryBot.create(:nickname, content: "ポテト", category: "arbitrary_name")}

  describe 'the function to sign in' do
    context 'to register new account' do
      it 'is shown in new_user\'s page' do
        visit new_user_registration_path
        fill_in 'user[family_name]', with: 'new'
        fill_in 'user[first_name]', with: 'user'
        fill_in 'user[email]', with: 'new_user@example.com'
        fill_in 'user[password]', with: 'newuser'
        fill_in 'user[password_confirmation]', with: 'newuser'
        click_on 'アカウント登録'
        expect(page).to have_content 'Lounge'
      end

      it 'is given an nickname' do
        user = FactoryBot.create(:user)
        user.nickname = user.make_nickname
        sign_in(user)
        visit user_path(user)
        expect(page).to have_content "#{user.nickname}"
      end
    end
  end
  
  describe 'the function to log in' do
    let!(:user){ FactoryBot.create(:user)}
    context 'to log in as general user' do
      it 'is show users nickname when visit mypage' do
        sign_in(user)
        visit user_path(user)
        expect(page).to have_content "nickname"
      end
    end

    let!(:user){ FactoryBot.create(:user)}
    context 'to log out as general user ' do
      it 'redirect to the login page' do
        sign_in(user)
        visit teams_path
        click_on "#{user.id}"
        click_on "ログアウト"
        expect(current_path).to eq new_user_session_path
      end
    end

    context 'to log in as guest user' do
      it 'is show "guest" when visit mypage' do
        visit new_user_session_path
        click_on "ゲストログイン"
        expect(page).to have_content "一般"
      end
    end

    context 'to log out as guest admin user ' do
      it 'is show "admin" when visit mypage' do
        visit new_user_session_path
        click_on "管理ゲストとしてログイン"
        expect(page).to have_content "管理"
      end
    end
  end
end
