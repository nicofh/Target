require 'rails_helper'

RSpec.describe Target, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:user_id) }
  end
end
