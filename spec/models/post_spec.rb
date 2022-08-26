require 'rails_helper'
describe 'The function of task management', type: :model do
  let!(:user){ FactoryBot.create(:user) }

  describe 'validation test' do
    context 'post content is nill' do
      it 'is invalid' do
        post = FactoryBot.build(:post, content: "", user: user)
        expect(post).to be_invalid
      end
    end

    context 'the length of post content is over 200 ' do
      it 'is invalid' do
        post = FactoryBot.build(:post, content: "#{"失敗するよ!"* 40}", user: user)
        expect(post).to be_invalid
      end
    end

    context 'length is 200 characters or less and content presents' do
      it 'is valid' do
        post = FactoryBot.create(:post, content: '成功テスト', user: user)
        expect(post).to be_valid
      end
    end
  end
end
