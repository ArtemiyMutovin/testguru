require 'rails_helper'

RSpec.describe BadgesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let!(:badges) { create_list(:badge, 3, users: [user]) }

    before do
      login(user)
      get :index
    end

    it 'populates an array of all badges' do
      expect(assigns(:badges)).to match_array(badges)
    end

    it 'current user personal badges' do
      expect(assigns(:user_badges)).to eq(user.badges)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
