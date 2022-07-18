require 'rails_helper'

RSpec.describe Admin::TestsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:test) { create(:test, users: [admin]) }

  describe 'GET #index' do
    let(:tests) { create_list(:test, 3, users: [admin]) }

    before do
      login(admin)
      get :index
    end

    it 'populates an array of all tests' do
      expect(assigns(:tests)).to match_array(tests)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      login(admin)
      get :show, params: { id: test }
    end

    it 'assigns the requested test to @test' do
      expect(assigns(:test)).to eq test
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      login(admin)
      get :new, params: { test_id: test }
    end

    it 'assigns the requested test to @test' do
      expect(assigns(:test)).to be_a_new(Test)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login(admin)
      get :edit, params: { id: test }
    end

    it 'assigns the requested test to @test' do
      expect(assigns(:test)).to eq test
    end

    it 'renders show view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'saves a new test in database' do
        expect { post :create, params: { test: attributes_for(:test) } }
          .to change(Test, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { test: attributes_for(:test) }
        expect(response).to redirect_to admin_test_path(assigns(:test))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new test in database' do
        expect { post :create, params: { test: attributes_for(:test, :invalid) } }
          .not_to change(Test, :count)
      end

      it 're-renders new view' do
        post :create, params: { test: attributes_for(:test, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'assigns the requested test to @test' do
        patch :update, params: { id: test, test: attributes_for(:test) }
        expect(assigns(:test)).to eq test
      end

      it 'changes test attributes' do
        patch :update, params: { id: test, test: { title: 'new title', level: 1 } }
        test.reload

        expect(test.title).to eq 'new title'
        expect(test.level).to eq 1
      end

      it 'redirects to updated test' do
        patch :update, params: { id: test, test: attributes_for(:test) }
        expect(response).to redirect_to admin_test_path(assigns(:test))
      end
    end

    context 'with invalid attributes' do
      it 'does not change question' do
        title = test.title
        patch :update, params: { id: test, test: attributes_for(:test, :invalid) }
        test.reload

        expect(test.title).to eq title
        expect(test.level).to eq 4
      end

      it 're-renders edit view' do
        patch :update, params: { id: test, test: attributes_for(:test, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:test) { create(:test, users: [admin]) }

    before do
      login(admin)
    end

    it 'deletes the test' do
      expect { delete :destroy, params: { id: test } }
        .to change(Test, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: test }
      expect(response).to redirect_to admin_tests_path
    end
  end
end
