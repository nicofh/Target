require 'rails_helper'

RSpec.describe Target, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:user) }
  end

  describe 'matches' do
    let!(:target_1) do
      create(:target,
             length: 200, latitude: -34.90644397, longitude: -56.20093115,
             topic: 'Politics')
    end

    let!(:target_2) do
      create(:target,
             length: 200, latitude: -34.90733909, longitude: -56.19726226,
             topic: 'Politics')
    end

    let!(:target_3) do
      create(:target,
             length: 200, latitude: -34.90876542, longitude: -56.19440534,
             topic: 'Politics')
    end

    let!(:target_4) do
      create(:target,
             length: 500, latitude: -34.91056160, longitude: -56.21137661,
             topic: 'Politics', user: User.find(1))
    end

    let!(:target_5) do
      create(:target,
             length: 500, latitude: -34.91056160, longitude: -56.21137661,
             topic: 'Politics', user: User.find(1))
    end

    context 'one target' do
      it 'returns compatible target' do
        expect(target_1.matches).to include(target_2)
      end
    end

    context 'two target' do
      it 'returns compatible targets' do
        expect(target_2.matches).to include(target_1, target_3)
      end
    end

    context 'target from same user' do
      it 'returns empty array' do
        expect(target_4.matches).to be_empty
      end
    end
  end
end
