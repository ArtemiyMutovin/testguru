require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { is_expected.to belong_to :question }

  it { is_expected.to validate_presence_of :title }

  describe 'validate answer uniqueness' do
    let!(:answer) { create(:answer) }

    it { is_expected.to validate_uniqueness_of :title }
  end
end
