require 'rails_helper'

RSpec.describe Admin::AnswersController, type: :controller do
  let(:admin) { create(:admin) }
  let(:test) { create(:test, users: [admin]) }
  let(:question) { create(:question, test: test, author: admin) }
  let(:answer) { create(:answer, question: question) }

  describe 'GET #show' do
    before do
      login(admin)
      get :show, params: { id: answer }
    end

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      login(admin)
      get :new, params: { question_id: question }
    end

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'assigns the requested Answer link to @answer.links' do
      expect(assigns(:answer).links.first).to be_a_new(Link)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      login(admin)
      get :edit, params: { id: answer }
    end

    it 'assigns the requested answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns the requested Answer link to @answer.links' do
      expect(assigns(:answer).links.first).to be_a_new(Link)
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
      it 'saves a new answer in database' do
        expect { post :create, params: { answer: attributes_for(:answer), question_id: question } }
          .to change(Answer, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { answer: attributes_for(:answer), question_id: question }
        expect(response).to redirect_to admin_answer_path(assigns(:answer))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new answer in database' do
        expect { post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question } }
          .not_to change(Answer, :count)
      end

      it 're-renders new view' do
        post :create, params: { answer: attributes_for(:answer, :invalid), question_id: question }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before do
      login(admin)
    end

    context 'with valid attributes' do
      it 'assigns the requested answer to @answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer) }
        expect(assigns(:answer)).to eq answer
      end

      it 'changes answer attributes' do
        patch :update, params: { id: answer, answer: { title: 'new answer', correct: false } }
        answer.reload

        expect(answer.title).to eq 'new answer'
        expect(answer.correct).to eq false
      end

      it 'redirects to updated answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer) }
        expect(response).to redirect_to admin_answer_path(assigns(:answer))
      end
    end

    context 'with invalid attributes' do
      it 'does not change answer' do
        patch :update, params: { id: answer, answer: attributes_for(:answer, :invalid) }
        answer.reload

        expect(answer.title).to eq 'Answer1'
        expect(answer.correct).to eq false
      end

      it 're-renders edit view' do
        patch :update, params: { id: answer, answer: attributes_for(:answer, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:answer) { create(:answer, question: question) }

    before do
      login(admin)
    end

    it 'deletes the answer' do
      expect { delete :destroy, params: { id: answer } }
        .to change(Answer, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: answer }
      expect(response).to redirect_to admin_questions_path(answer.question)
    end
  end
end
