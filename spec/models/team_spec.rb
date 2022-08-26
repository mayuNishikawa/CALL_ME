require 'rails_helper'
describe 'The function of team management', type: :model do

  describe 'validation test' do
    context 'team name is nill' do
      it 'is invalid' do
        team = FactoryBot.build(:team, name: "")
        expect(team).to be_invalid
      end
    end

    context 'the length of team name is over 20 ' do
      it 'is invalid' do
        team = FactoryBot.build(:team, name: "#{"失敗するよ"* 5}")
        expect(team).to be_invalid
      end
    end

    context 'length is 20 characters or less and name presents' do
      it 'is valid' do
        team = FactoryBot.create(:team, name: '成功テスト')
        expect(team).to be_valid
      end
    end
  end
end
