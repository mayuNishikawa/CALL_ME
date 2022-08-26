require 'rails_helper'
describe 'The function of user management', type: :model do

  describe 'validation test for family_name' do
    context 'family_name is nill' do
      it 'is invalid' do
        user = FactoryBot.build(:user, family_name: "")
        expect(user).to be_invalid
      end
    end

    context 'the length of family_name is over 20 ' do
      it 'is invalid' do
        user = FactoryBot.build(:user, family_name: "#{"失敗する名字"* 5}")
        expect(user).to be_invalid
      end
    end

    context 'length is 20 characters or less and family_name presents' do
      it 'is valid' do
        user = FactoryBot.create(:user, family_name: '成功する名字')
        expect(user).to be_valid
      end
    end
  end

  describe 'validation test for first_name' do
    context 'first_name is nill' do
      it 'is invalid' do
        user = FactoryBot.build(:user, first_name: "")
        expect(user).to be_invalid
      end
    end

    context 'the length of firsst_name is over 20 ' do
      it 'is invalid' do
        user = FactoryBot.build(:user, first_name: "#{"失敗する名字"* 5}")
        expect(user).to be_invalid
      end
    end

    context 'length is 20 characters or less and first_name presents' do
      it 'is valid' do
        user = FactoryBot.create(:user, first_name: '成功する名字')
        expect(user).to be_valid
      end
    end
  end

  describe 'validation test for nickname' do
    context 'nickname is nill' do
      it 'is invalid' do
        user = FactoryBot.build(:user, nickname: "")
        expect(user).to be_invalid
      end
    end

    context 'the length of nickname is over 20 ' do
      it 'is invalid' do
        user = FactoryBot.build(:user, nickname: "#{"失敗する名字"* 5}")
        expect(user).to be_invalid
      end
    end

    context 'length is 20 characters or less and nickname presents' do
      it 'is valid' do
        user = FactoryBot.create(:user, nickname: '成功する名字')
        expect(user).to be_valid
      end
    end
  end

  describe 'validation test for profile' do
    context 'the length of profile is over 200 ' do
      it 'is invalid' do
        user = FactoryBot.build(:user, profile: "#{"失敗するよ！"* 40}")
        expect(user).to be_invalid
      end
    end

    context 'length is 200 characters' do
      it 'is valid' do
        user = FactoryBot.create(:user, profile: '成功テスト')
        expect(user).to be_valid
      end
    end
  end
end
