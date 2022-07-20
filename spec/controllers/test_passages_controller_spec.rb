require 'rails_helper'

RSpec.describe TestPassagesController, type: :controller do
  let(:user) { create(:user) }
  let(:test) { create(:test, users: [user]) }
  let(:question) { create(:question, test: test) }
  let(:answer) { create(:answer, question: question) }
  let(:test_passage) { create(:test_passage, user: user, test: test, current_question_id: question) }

  describe 'GET #show' do
    before do
      login(user)
      get :show, params: { id: test_passage }
    end

    it 'assigns the requested test_passage to @test_passage' do
      expect(assigns(:test_passage)).to eq test_passage
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #result' do
    before do
      login(user)
      get :result, params: { id: test_passage }
    end

    it 'assigns the requested test_passage to @test_passage' do
      expect(assigns(:test_passage)).to eq test_passage
    end

    it 'renders result view' do
      expect(response).to render_template :result
    end
  end
end
