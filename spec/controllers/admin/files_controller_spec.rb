require 'rails_helper'

RSpec.describe Admin::FilesController, type: :controller do
  describe 'DELETE #destroy' do
    let(:admin) { create(:admin) }
    let(:test) { create(:test, users: [admin]) }
    let(:question) { create(:question, :with_files, test: test) }

    before do
      login(admin)
    end

    it 'deletes the question file' do
      expect { delete :destroy, params: { id: question.files.first } }
        .to change(question.files, :count).by(-1)
    end
  end
end
