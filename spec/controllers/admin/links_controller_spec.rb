require 'rails_helper'

RSpec.describe Admin::LinksController, type: :controller do
  describe 'DELETE #destroy' do
    let(:admin) { create(:admin) }
    let(:test) { create(:test, users: [admin]) }
    let(:question) { create(:question, :with_files, test: test) }
    let!(:link) { create(:google_link, linkable: question) }

    before do
      login(admin)
    end

    it 'deletes the question link' do
      expect { delete :destroy, params: { id: question.links.first } }
        .to change(question.links, :count).by(-1)
    end
  end
end
