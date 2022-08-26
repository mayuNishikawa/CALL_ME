require 'rails_helper'
describe 'The function of task management', type: :model do
  describe 'validation test' do
    context 'nickname content is nill' do
      it 'is invalid' do
        nickname = FactoryBot.build(:nickname, content: "")
        expect(nickname).to be_invalid
      end
    end

    context 'the length of nickname content is over 10 ' do
      it 'is invalid' do
        nickname = FactoryBot.build(:nickname, content: "#{"失敗するよ!"* 2}")
        expect(nickname).to be_invalid
      end
    end

    context 'length is 200 characters or less and content presents' do
      it 'is valid' do
        nickname = FactoryBot.create(:nickname, content: '成功テスト')
        expect(nickname).to be_valid
      end
    end
  end
end
