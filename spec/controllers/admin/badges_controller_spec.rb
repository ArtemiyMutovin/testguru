require 'rails_helper'

RSpec.describe Admin::BadgesController, type: :controller do
  let(:admin) { create(:admin) }
  let(:badge) { create(:badge, users: [admin]) }

  describe 'GET #index' do
    let(:badges) { create_list(:badge, 3, users: [admin]) }

    before do
      login(admin)
      get :index
    end

    it 'populates an array of all badges' do
      expect(assigns(:badges)).to match_array(badges)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      login(admin)
      get :new, params: { id: badge }
    end

    it 'assigns the requested badge to @badge' do
      expect(assigns(:badge)).to be_a_new(Badge)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'saves a new badge in database' do
        expect { post :create, params: { badge: attributes_for(:badge) } }
          .to change(Badge, :count).by(1)
      end

      it 'redirects to index view' do
        post :create, params: { badge: attributes_for(:badge) }
        expect(response).to redirect_to admin_badges_path
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new badge in database' do
        expect { post :create, params: { badge: attributes_for(:badge, :invalid) } }
          .not_to change(Badge, :count)
      end

      it 're-renders new view' do
        post :create, params: { badge: attributes_for(:badge, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before do
      login(admin)
      get :edit, params: { id: badge }
    end

    it 'assigns the requested badge to @badge' do
      expect(assigns(:badge)).to eq badge
    end

    it 'renders show view' do
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:badge) { create(:badge, users: [admin]) }

    before do
      login(admin)
    end

    it 'deletes the badge' do
      expect { delete :destroy, params: { id: badge } }
        .to change(Badge, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: badge }
      expect(response).to redirect_to admin_badges_path
    end
  end

  describe 'PATCH #update' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'assigns the requested badge to @badge' do
        patch :update, params: { id: badge, badge: attributes_for(:badge) }
        expect(assigns(:badge)).to eq badge
      end

      it 'changes test attributes' do
        patch :update, params: { id: badge, badge: { name: 'new name', file: 'new file',
                                                     rule_type: 'level', rule_value: 'new value' } }
        badge.reload

        expect(badge.name).to eq 'new name'
        expect(badge.file).to eq 'new file'
        expect(badge.rule_type).to eq 'level'
        expect(badge.rule_value).to eq 'new value'
      end

      it 'redirects to updated badges' do
        patch :update, params: { id: badge, badge: attributes_for(:badge) }
        expect(response).to redirect_to admin_badges_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change badge' do
        patch :update, params: { id: badge, badge: attributes_for(:badge, :invalid) }
        badge.reload

        expect(badge.name).to eq 'name'
        expect(badge.file).to eq 'file'
        expect(badge.rule_type).to eq 'category'
        expect(badge.rule_value).to eq 'value'
      end

      it 're-renders edit view' do
        patch :update, params: { id: badge, badge: attributes_for(:badge, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end
end
