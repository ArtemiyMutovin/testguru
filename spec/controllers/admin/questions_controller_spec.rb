require 'rails_helper'

RSpec.describe Admin::QuestionsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:test) { create(:test, users: [admin]) }
  let(:question) { create(:question, test: test, author: admin) }

  describe 'GET #index' do
    let(:questions) { create_list(:question, 3, test: test, author: admin) }

    before do
      login(admin)
      get :index, params: { test_id: test }
    end

    it 'populates an array of all questions' do
      expect(assigns(:questions)).to match_array(questions)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      login(admin)
      get :show, params: { id: question }
    end

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
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

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'assigns the requested Question link to @question.links' do
      expect(assigns(:question).links.first).to be_a_new(Link)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login(admin)
      get :edit, params: { id: question }
    end

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns the requested Question link to @question.links' do
      expect(assigns(:question).links.first).to be_a_new(Link)
    end

    it 'renders show view' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'assigns the requested question to @question' do
        patch :update, params: { id: question, question: attributes_for(:question), test_id: test }
        expect(assigns(:question)).to eq question
      end

      it 'changes question attributes' do
        patch :update, params: { id: question, question: { title: 'new title' }, test_id: test }
        question.reload

        expect(question.title).to eq 'new title'
      end

      it 'redirects to updated question' do
        patch :update, params: { id: question, question: attributes_for(:question), test_id: test }
        expect(response).to redirect_to admin_question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'does not change question' do
        patch :update, params: { id: question, question: attributes_for(:question, :invalid), test_id: test }
        question.reload

        expect(question.title).to eq 'Question1'
      end

      it 're-renders edit view' do
        patch :update, params: { id: question, question: attributes_for(:question, :invalid), test_id: test }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST #create' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'saves a new question in database' do
        expect { post :create, params: { question: attributes_for(:question), test_id: test } }
          .to change(Question, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { question: attributes_for(:question), test_id: test }
        expect(response).to redirect_to admin_question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new question in database' do
        expect { post :create, params: { question: attributes_for(:question, :invalid), test_id: test } }
          .not_to change(Question, :count)
      end

      it 're-renders new view' do
        post :create, params: { question: attributes_for(:question, :invalid), test_id: test }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:question) { create(:question, test: test, author: admin) }

    before do
      login(admin)
    end

    it 'deletes the question' do
      expect { delete :destroy, params: { id: question } }
        .to change(Question, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: question }
      expect(response).to redirect_to admin_questions_path
    end
  end
end
