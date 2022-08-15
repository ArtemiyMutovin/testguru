require 'rails_helper'

RSpec.describe Admin::SubscriptionsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:question) { create(:question, author: admin) }

  describe 'POST #create' do
    context 'when user authorized' do
      before { login admin }

      it 'saves a new subscription in the database' do
        expect do
          post :create, params: { question_id: question }
        end.to change(question.subscriptions, :count).by(1)
        expect(response).to redirect_to admin_question_subscriptions_path(assigns(:question))
      end
    end
  end

  describe 'DELETE #unsubscribe' do
    let!(:subscription) { create(:subscription, question: question, user: admin) }

    context 'when user authorized' do
      before { login admin }

      it 'delete a subscription in the database' do
        expect do
          delete :destroy, params: { id: subscription }
        end.to change(question.subscriptions, :count).by(-1)
      end
    end
  end
end
