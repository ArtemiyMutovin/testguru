require 'rails_helper'

RSpec.describe TestsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:tests) { create_list(:test, 3, users: [user]) }

    before do
      login(user)
      get :index
    end


    it 'populates an array of all tests' do
      expect(assigns(:tests)).to match_array(tests)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #start' do
    let(:user) { create(:user) }
    let!(:test) { create(:test, users: [user]) }

    it 'user start test' do
      login(user)
      expect do
        post :start, params: { id: test.id }
      end.to change(user.tests, :count).by(1)
      expect(response).to redirect_to user.test_passage(test)
    end
  end
end
