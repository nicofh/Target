require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe TargetsController, type: controller do
  before(:each) do
    @target = create(:target)
  end

  describe 'POST create' do
    it 'creates target' do
      expect do
        post :create, params: { target: @target.attributes }
      end.to change(Target, :count).by(1)
    end
  end

  describe 'GET index' do
    it 'render a list of targets' do
      DatabaseCleaner.clean
      target1 = create(:target)
      target2 = create(:target)
      get :index
      expect(assigns(:targets)).to match_array([target1, target2])
    end
  end
end
