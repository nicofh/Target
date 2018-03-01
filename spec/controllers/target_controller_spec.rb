require 'rails_helper'

describe TargetsController, type: :controller do
  let(:target) { build :target }

  describe 'POST create' do
    it 'creates target' do
      expect do
        post :create, params: { target: target.attributes }
      end.to change(Target, :count).by(1)
    end
  end

  describe 'GET index' do
    it 'renders a list of targets' do
      targets = create_list(:target, 2)
      get :index
      expect(assigns(:targets)).to match_array(targets)
    end
  end
end
