require 'rails_helper'
RSpec.describe 'Posting in Lounge', type: :system do
  let!(:team_member){ FactoryBot.create(:user, nickname: "team_member")}
  let!(:owner_user){ FactoryBot.create(:user, nickname: "owner_user", email: "owner@example.com")}
  let!(:team){ FactoryBot.create(:team, owner: owner_user)}
  let!(:assign){ FactoryBot.create(:assign, user: owner_user, team: team)}
  let!(:assign){ FactoryBot.create(:assign, user: team_member, team: team)}
  before do
    sign_in(team_member)
  end

  describe 'the function to manage team' do
    context 'to create new team' do
      it 'is shown in index page' do
        visit teams_path
        fill_in 'team[name]', with: 'new team'
        click_on '作成'
        expect(page).to have_content 'new team'
      end
    end

    context 'to edit the team' do
      it 'is shown the updated team' do
        visit edit_team_path(team)
        find(".right_content").fill_in 'team[name]', with: 'changed team name'
        find(".right_content").click_on '作成'
        expect(page).to have_content 'changed team name'
      end
    end

    context 'to destroy the team' do
      it 'is not shown the team' do
        visit member_team_path(team)
        click_on "チームを削除"
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content 'factory team'
      end
    end
  end
  
  describe 'the function to assign member to the team' do
    context 'to invite the new member' do
      it 'is shown the member\'s page' do
        new_member = FactoryBot.create(:user, nickname: "new user", email: "new_member@example.com")
        visit member_team_path(team)
        fill_in 'post[email]', with: 'new_member@example.com'
        click_on 'チーム作成'
        expect(page).to have_content new_member.nickname
      end
    end

    context 'to remove the team' do
      it 'is not shown the team' do
        visit member_team_path(team)
        click_on 'チームから退出'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content team.name
      end
    end
  end
end
