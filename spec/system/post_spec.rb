require 'rails_helper'
RSpec.describe 'Posting in Lounge', type: :system do
  let!(:user){ FactoryBot.create(:user) }
  let!(:post){ FactoryBot.create(:post, user: user) }
  before do
    sign_in(user)
  end

  describe 'the function to create and edit post' do
    context 'to create new post' do
      it 'is shown in index page' do
        visit new_post_path
        fill_in 'post[content]', with: 'new post'
        click_on '投稿'
        expect(page).to have_content 'new post'
      end
    end

    context 'to edit the post' do
      it 'is shown the updated post' do
        visit edit_post_path(post.id)
        fill_in 'post[content]', with: 'changed content'
        click_on '投稿'
        expect(page).to have_content 'changed content'
      end
    end
  end

  describe 'the function to display in Lounge' do
    context 'to display task' do
      it 'is shown in index page' do
        visit posts_path
        expect(page).to have_content 'only have content'
      end
    end

    context 'to display the new post' do
      it 'is shown the new post' do
        visit new_post_path
        fill_in 'post[content]', with: 'new post'
        click_on '投稿'
        visit posts_path
        expect(page).to have_content 'new post'
      end
    end

    context 'to display the updated post' do
      it 'is shown the updated post' do
        visit edit_post_path(post)
        fill_in 'post[content]', with: 'changed content'
        click_on '投稿'
        visit posts_path
        expect(page).to have_content 'changed content'
      end
    end
  end
  
  describe 'the function to visit link the post contains' do
    context 'to click the link to show' do
      it 'is shown the post\'s page' do
        visit posts_path
        click_on 'コメント: 0件'
        expect(page).to have_content 'コメント'
      end
    end

    context 'to click the icon in the post' do
      it 'is shown the post\'s page' do
        visit posts_path
        find(".right_content").click_on "#{user.id}"
        expect(page).to have_content "#{user.nickname}の部屋"
      end
    end
  end
end
