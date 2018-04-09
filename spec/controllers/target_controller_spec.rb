require 'rails_helper'

describe TargetsController, type: :controller do
  render_views
  let(:target) { build :target }

  describe 'POST create' do
    context 'when the user is logged in' do
      before :each do
        login_user
      end

      it 'creates target' do
        expect do
          post :create, params: { target: target.attributes }
        end.to change(Target, :count).by(1)
      end
    end

    context 'when the user is not logged in' do
      it 'does not create target' do
        expect do
          post :create, params: { target: target.attributes }
        end.not_to change(Target, :count)
      end
    end
  end

  describe 'GET index' do
    context 'when the user is logged in' do
      before :each do
        login_user
      end

      it 'renders a list of targets' do
        targets = create_list(:target, 2)
        get :index
        expect(assigns(:targets)).to match_array(targets)
      end

      context 'with JSON format' do
        before :each do
          login_user
        end

        let!(:target_1) { create :target, user: User.find(2) }
        let!(:target_2) { create :target }

        before :each do
          get :index, format: :json
          @parsed_body = JSON.parse(response.body)
        end

        it 'renders a list of targets' do
          expect(@parsed_body.length).to eq(2)
        end

        it 'renders the edit url for each target' do
          expect(@parsed_body[0]['edit_url']).to eq(edit_target_url(target_1))
        end
      end

      context 'when a target has a match' do
        let!(:target_1) do
          create(:target,
                 length: 1000, latitude: -34.905446, longitude: -56.206291,
                 topic: 'Football', user: User.find(1))
        end

        let!(:target_compatible) do
          create(:target,
                 length: 1000, latitude: -34.906048, longitude: -56.205994,
                 topic: 'Football')
        end

        it 'returns compatible targets' do
          get :index
          expect(assigns(:matches)).to match_array(target_1.matches)
        end
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:target) { create(:target) }
    context 'not being logged in' do
      it 'does not destroy the target' do
        expect do
          delete :destroy, params: { id: target.id }
        end.to_not change(Target, :count)
      end
    end

    context 'being logged in' do
      before :each do
        login_user(target.user)
      end

      it 'redirects to new_target_path' do
        delete :destroy, params: { id: target.id }
        response.should redirect_to new_target_path
      end

      it 'destroys the target' do
        expect do
          delete :destroy, params: { id: target.id }
        end.to change(Target, :count).by(-1)
      end
    end
  end
end
