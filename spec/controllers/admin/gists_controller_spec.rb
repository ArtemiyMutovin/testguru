require 'rails_helper'

RSpec.describe Admin::GistsController, type: :controller do
  let(:admin) { create(:admin) }

  describe 'GET #index' do
    let(:gists) { create_list(:gist, 3, user: admin) }

    before do
      login(admin)
      get :index
    end

    it 'populates an array of all gists' do
      expect(assigns(:gists)).to match_array(gists)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
